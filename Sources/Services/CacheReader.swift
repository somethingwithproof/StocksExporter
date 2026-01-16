import Foundation

enum CacheError: LocalizedError {
    case cacheNotFound
    case invalidCacheFormat
    case parsingFailed(String)

    var errorDescription: String? {
        switch self {
        case .cacheNotFound:
            return "Stock widget cache not found. Make sure you have the Stocks widget on your desktop or notification center."
        case .invalidCacheFormat:
            return "Cache file format is invalid or has changed."
        case .parsingFailed(let detail):
            return "Failed to parse cache: \(detail)"
        }
    }
}

final class CacheReader: @unchecked Sendable {
    static let shared = CacheReader()

    private let possibleCachePaths: [String] = [
        "Library/Containers/com.apple.stocks/Data/Library/Caches",
        "Library/Group Containers/group.com.apple.stocks/Library/Caches",
        "Library/Caches/com.apple.stocks",
        "Library/Group Containers/group.com.apple.Chronology/Cache"
    ]

    private let widgetCacheFilenames: [String] = [
        "widget-stocks.json",
        "stocks-widget.json",
        "watchlist.json",
        "StocksWidget.json"
    ]

    private init() {}

    func readFromCache() async throws -> [StockItem] {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser

        for path in possibleCachePaths {
            let cacheDir = homeDir.appendingPathComponent(path)

            if let stocks = try? await searchCacheDirectory(cacheDir) {
                return stocks
            }

            for filename in widgetCacheFilenames {
                let filePath = cacheDir.appendingPathComponent(filename)
                if let stocks = try? await parseStocksCacheFile(filePath) {
                    return stocks
                }
            }
        }

        if let stocks = try? await searchChronologyCache() {
            return stocks
        }

        throw CacheError.cacheNotFound
    }

    private func searchCacheDirectory(_ directory: URL) async throws -> [StockItem] {
        let fileManager = FileManager.default

        guard fileManager.fileExists(atPath: directory.path) else {
            throw CacheError.cacheNotFound
        }

        let contents = try fileManager.contentsOfDirectory(
            at: directory,
            includingPropertiesForKeys: [.contentModificationDateKey],
            options: [.skipsHiddenFiles]
        )

        let jsonFiles = contents.filter { $0.pathExtension == "json" }

        let sortedFiles = try jsonFiles.sorted { file1, file2 in
            let date1 = try file1.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate ?? .distantPast
            let date2 = try file2.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate ?? .distantPast
            return date1 > date2
        }

        for file in sortedFiles {
            if let stocks = try? await parseStocksCacheFile(file), !stocks.isEmpty {
                return stocks
            }
        }

        throw CacheError.cacheNotFound
    }

    private func searchChronologyCache() async throws -> [StockItem] {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        let chronologyPath = homeDir.appendingPathComponent("Library/Group Containers/group.com.apple.Chronology")

        let fileManager = FileManager.default
        guard fileManager.fileExists(atPath: chronologyPath.path) else {
            throw CacheError.cacheNotFound
        }

        let enumerator = fileManager.enumerator(
            at: chronologyPath,
            includingPropertiesForKeys: [.contentModificationDateKey],
            options: [.skipsHiddenFiles]
        )

        var candidates: [(URL, Date)] = []

        while let fileURL = enumerator?.nextObject() as? URL {
            guard fileURL.pathExtension == "json" else { continue }

            let filename = fileURL.lastPathComponent.lowercased()
            if filename.contains("stock") || filename.contains("watchlist") || filename.contains("widget") {
                let date = (try? fileURL.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate) ?? .distantPast
                candidates.append((fileURL, date))
            }
        }

        candidates.sort { $0.1 > $1.1 }

        for (url, _) in candidates {
            if let stocks = try? await parseStocksCacheFile(url), !stocks.isEmpty {
                return stocks
            }
        }

        throw CacheError.cacheNotFound
    }

    private func parseStocksCacheFile(_ url: URL) async throws -> [StockItem] {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data)

        if let stocks = try? parseWidgetFormat(json) {
            return stocks
        }

        if let stocks = try? parseWatchlistFormat(json) {
            return stocks
        }

        if let stocks = try? parseArrayFormat(json) {
            return stocks
        }

        throw CacheError.invalidCacheFormat
    }

    private func parseWidgetFormat(_ json: Any) throws -> [StockItem] {
        guard let dict = json as? [String: Any] else {
            throw CacheError.invalidCacheFormat
        }

        var stocks: [StockItem] = []

        func searchForStocks(in obj: Any) {
            if let array = obj as? [[String: Any]] {
                for item in array {
                    if let stock = parseStockDict(item) {
                        stocks.append(stock)
                    }
                }
            } else if let dict = obj as? [String: Any] {
                if let stock = parseStockDict(dict) {
                    stocks.append(stock)
                }
                for (_, value) in dict {
                    searchForStocks(in: value)
                }
            }
        }

        searchForStocks(in: dict)
        return stocks
    }

    private func parseWatchlistFormat(_ json: Any) throws -> [StockItem] {
        guard let dict = json as? [String: Any],
              let watchlist = dict["watchlist"] as? [[String: Any]] ?? dict["stocks"] as? [[String: Any]]
        else {
            throw CacheError.invalidCacheFormat
        }

        return watchlist.compactMap { parseStockDict($0) }
    }

    private func parseArrayFormat(_ json: Any) throws -> [StockItem] {
        guard let array = json as? [[String: Any]] else {
            throw CacheError.invalidCacheFormat
        }

        return array.compactMap { parseStockDict($0) }
    }

    private func parseStockDict(_ dict: [String: Any]) -> StockItem? {
        let symbolKeys = ["symbol", "ticker", "tickers", "Symbol", "Ticker"]
        let nameKeys = ["name", "companyName", "company_name", "shortName", "Name", "CompanyName"]
        let priceKeys = ["price", "regularMarketPrice", "lastPrice", "Price", "currentPrice"]
        let changeKeys = ["change", "regularMarketChange", "priceChange", "Change"]
        let percentKeys = ["changePercent", "regularMarketChangePercent", "percentChange", "ChangePercent", "change_percent"]

        var symbol: String?
        for key in symbolKeys {
            if let s = dict[key] as? String {
                symbol = s
                break
            }
        }

        guard let sym = symbol else { return nil }

        var name: String?
        for key in nameKeys {
            if let n = dict[key] as? String {
                name = n
                break
            }
        }

        var price: Double?
        for key in priceKeys {
            if let p = dict[key] as? Double {
                price = p
                break
            } else if let p = dict[key] as? Int {
                price = Double(p)
                break
            } else if let p = dict[key] as? String, let parsed = Double(p) {
                price = parsed
                break
            }
        }

        var change: Double?
        for key in changeKeys {
            if let c = dict[key] as? Double {
                change = c
                break
            } else if let c = dict[key] as? String, let parsed = Double(c) {
                change = parsed
                break
            }
        }

        var changePercent: Double?
        for key in percentKeys {
            if let cp = dict[key] as? Double {
                changePercent = cp
                break
            } else if let cp = dict[key] as? String, let parsed = Double(cp.replacingOccurrences(of: "%", with: "")) {
                changePercent = parsed
                break
            }
        }

        let marketCap = dict["marketCap"] as? String ?? dict["market_cap"] as? String
        let volume = dict["volume"] as? String ?? (dict["volume"] as? Int).map { String($0) }

        return StockItem(
            symbol: sym,
            name: name ?? sym,
            price: price,
            change: change,
            changePercent: changePercent,
            marketCap: marketCap,
            volume: volume
        )
    }
}
