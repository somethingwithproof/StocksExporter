// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import Foundation

struct ExportColumn: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    var isEnabled: Bool

    var localizedName: String {
        switch id {
        case "symbol": return L10n.string("column.symbol")
        case "name": return L10n.string("column.company_name")
        case "price": return L10n.string("column.price")
        case "change": return L10n.string("column.change")
        case "changePercent": return L10n.string("column.change_percent")
        case "marketCap": return L10n.string("column.market_cap")
        case "volume": return L10n.string("column.volume")
        default: return name
        }
    }

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
