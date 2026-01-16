import Foundation
import AppKit
import UniformTypeIdentifiers

final class ExportService: @unchecked Sendable {
    static let shared = ExportService()

    private init() {}

    func exportToCSV(stocks: [StockItem], columns: [ExportColumn], includeHeader: Bool) -> String {
        let enabledColumns = columns.filter { $0.isEnabled }

        var lines: [String] = []

        if includeHeader {
            let header = enabledColumns.map { $0.name }.joined(separator: ",")
            lines.append(header)
        }

        for stock in stocks {
            let values = enabledColumns.map { column -> String in
                let value = getValue(for: column.id, from: stock)
                if value.contains(",") || value.contains("\"") || value.contains("\n") {
                    return "\"\(value.replacingOccurrences(of: "\"", with: "\"\""))\""
                }
                return value
            }
            lines.append(values.joined(separator: ","))
        }

        return lines.joined(separator: "\n")
    }

    func exportToJSON(stocks: [StockItem], columns: [ExportColumn]) throws -> String {
        let enabledColumns = columns.filter { $0.isEnabled }

        let exportData = stocks.map { stock -> [String: Any] in
            var dict: [String: Any] = [:]
            for column in enabledColumns {
                dict[column.id] = getTypedValue(for: column.id, from: stock)
            }
            return dict
        }

        let jsonData = try JSONSerialization.data(withJSONObject: exportData, options: [.prettyPrinted, .sortedKeys])
        return String(data: jsonData, encoding: .utf8) ?? "[]"
    }

    private func getValue(for columnId: String, from stock: StockItem) -> String {
        switch columnId {
        case "symbol": return stock.symbol
        case "name": return stock.name
        case "price": return stock.price.map { String(format: "%.2f", $0) } ?? ""
        case "change": return stock.change.map { String(format: "%.2f", $0) } ?? ""
        case "changePercent": return stock.changePercent.map { String(format: "%.2f", $0) } ?? ""
        case "marketCap": return stock.marketCap ?? ""
        case "volume": return stock.volume ?? ""
        default: return ""
        }
    }

    private func getTypedValue(for columnId: String, from stock: StockItem) -> Any {
        switch columnId {
        case "symbol": return stock.symbol
        case "name": return stock.name
        case "price": return stock.price as Any
        case "change": return stock.change as Any
        case "changePercent": return stock.changePercent as Any
        case "marketCap": return stock.marketCap as Any
        case "volume": return stock.volume as Any
        default: return NSNull()
        }
    }

    @MainActor
    func saveWithDialog(content: String, format: ExportFormat, suggestedName: String = "stocks-export") -> URL? {
        let savePanel = NSSavePanel()
        savePanel.title = "Export Watchlist"
        savePanel.nameFieldStringValue = "\(suggestedName).\(format.fileExtension)"

        let utType: UTType = format == .csv ? .commaSeparatedText : .json
        savePanel.allowedContentTypes = [utType]
        savePanel.canCreateDirectories = true

        guard savePanel.runModal() == .OK, let url = savePanel.url else {
            return nil
        }

        do {
            try content.write(to: url, atomically: true, encoding: .utf8)
            return url
        } catch {
            return nil
        }
    }

    func copyToClipboard(content: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(content, forType: .string)
    }
}
