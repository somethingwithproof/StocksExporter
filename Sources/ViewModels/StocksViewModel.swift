import Foundation
import SwiftUI
import Combine

enum DataSource: String, CaseIterable {
    case accessibility = "Stocks App (Accessibility)"
    case cache = "Widget Cache"
    case auto = "Auto-detect"
}

enum LoadingState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
}

@MainActor
final class StocksViewModel: ObservableObject {
    @Published var stocks: [StockItem] = []
    @Published var selectedStocks: Set<StockItem.ID> = []
    @Published var loadingState: LoadingState = .idle
    @Published var searchText: String = ""
    @Published var sortOrder: [KeyPathComparator<StockItem>] = [.init(\.symbol, order: .forward)]

    @Published var exportSettings: ExportSettings {
        didSet {
            saveSettings()
        }
    }

    @Published var dataSource: DataSource = .auto
    @Published var lastRefresh: Date?
    @Published var showingExportSheet: Bool = false
    @Published var exportFormat: ExportFormat = .csv

    private let accessibilityReader = AccessibilityReader.shared
    private let cacheReader = CacheReader.shared
    private let exportService = ExportService.shared

    var filteredStocks: [StockItem] {
        if searchText.isEmpty {
            return stocks
        }
        return stocks.filter {
            $0.symbol.localizedCaseInsensitiveContains(searchText) ||
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var selectedStockItems: [StockItem] {
        if selectedStocks.isEmpty {
            return filteredStocks
        }
        return filteredStocks.filter { selectedStocks.contains($0.id) }
    }

    var isAccessibilityAuthorized: Bool {
        accessibilityReader.isAuthorized
    }

    var isStocksAppRunning: Bool {
        accessibilityReader.isStocksAppRunning()
    }

    init() {
        self.exportSettings = Self.loadSettings()
        self.exportFormat = exportSettings.defaultFormat
    }

    func refresh() async {
        loadingState = .loading

        do {
            switch dataSource {
            case .accessibility:
                stocks = try await accessibilityReader.readWatchlist()
            case .cache:
                stocks = try await cacheReader.readFromCache()
            case .auto:
                if accessibilityReader.isAuthorized && accessibilityReader.isStocksAppRunning() {
                    do {
                        stocks = try await accessibilityReader.readWatchlist()
                    } catch {
                        stocks = try await cacheReader.readFromCache()
                    }
                } else {
                    do {
                        stocks = try await cacheReader.readFromCache()
                    } catch {
                        if !accessibilityReader.isAuthorized {
                            throw AccessibilityError.notAuthorized
                        } else {
                            throw AccessibilityError.stocksAppNotRunning
                        }
                    }
                }
            }

            lastRefresh = Date()
            loadingState = .loaded
        } catch {
            loadingState = .error(error.localizedDescription)
        }
    }

    func requestAccessibilityPermission() {
        accessibilityReader.requestAuthorization()
    }

    func launchStocksApp() {
        accessibilityReader.launchStocksApp()
    }

    func exportCSV() {
        let content = exportService.exportToCSV(
            stocks: selectedStockItems,
            columns: exportSettings.columns,
            includeHeader: exportSettings.includeHeader
        )

        if let url = exportService.saveWithDialog(content: content, format: .csv) {
            exportSettings.lastExportPath = url.deletingLastPathComponent().path
        }
    }

    func exportJSON() {
        guard let content = try? exportService.exportToJSON(
            stocks: selectedStockItems,
            columns: exportSettings.columns
        ) else { return }

        if let url = exportService.saveWithDialog(content: content, format: .json) {
            exportSettings.lastExportPath = url.deletingLastPathComponent().path
        }
    }

    func copyToClipboard(format: ExportFormat) {
        let content: String
        switch format {
        case .csv:
            content = exportService.exportToCSV(
                stocks: selectedStockItems,
                columns: exportSettings.columns,
                includeHeader: exportSettings.includeHeader
            )
        case .json:
            content = (try? exportService.exportToJSON(
                stocks: selectedStockItems,
                columns: exportSettings.columns
            )) ?? "[]"
        }

        exportService.copyToClipboard(content: content)
    }

    func generatePreview(format: ExportFormat) -> String {
        let previewStocks = Array(selectedStockItems.prefix(5))
        switch format {
        case .csv:
            return exportService.exportToCSV(
                stocks: previewStocks,
                columns: exportSettings.columns,
                includeHeader: exportSettings.includeHeader
            )
        case .json:
            return (try? exportService.exportToJSON(
                stocks: previewStocks,
                columns: exportSettings.columns
            )) ?? "[]"
        }
    }

    func toggleColumn(_ column: ExportColumn) {
        if let index = exportSettings.columns.firstIndex(where: { $0.id == column.id }) {
            exportSettings.columns[index].isEnabled.toggle()
        }
    }

    private static func loadSettings() -> ExportSettings {
        guard let data = UserDefaults.standard.data(forKey: "ExportSettings"),
              let settings = try? JSONDecoder().decode(ExportSettings.self, from: data)
        else {
            return .default
        }
        return settings
    }

    private func saveSettings() {
        guard let data = try? JSONEncoder().encode(exportSettings) else { return }
        UserDefaults.standard.set(data, forKey: "ExportSettings")
    }
}
