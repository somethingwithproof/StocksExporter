import Foundation

struct ExportColumn: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    var isEnabled: Bool

    static let allColumns: [ExportColumn] = [
        ExportColumn(id: "symbol", name: "Symbol", isEnabled: true),
        ExportColumn(id: "name", name: "Company Name", isEnabled: true),
        ExportColumn(id: "price", name: "Price", isEnabled: true),
        ExportColumn(id: "change", name: "Change", isEnabled: true),
        ExportColumn(id: "changePercent", name: "Change %", isEnabled: true),
        ExportColumn(id: "marketCap", name: "Market Cap", isEnabled: false),
        ExportColumn(id: "volume", name: "Volume", isEnabled: false)
    ]
}

enum ExportFormat: String, CaseIterable, Codable {
    case csv = "CSV"
    case json = "JSON"

    var fileExtension: String {
        rawValue.lowercased()
    }

    var contentType: String {
        switch self {
        case .csv: return "text/csv"
        case .json: return "application/json"
        }
    }
}

struct ExportSettings: Codable {
    var columns: [ExportColumn]
    var defaultFormat: ExportFormat
    var includeHeader: Bool
    var lastExportPath: String?

    static let `default` = ExportSettings(
        columns: ExportColumn.allColumns,
        defaultFormat: .csv,
        includeHeader: true,
        lastExportPath: nil
    )
}
