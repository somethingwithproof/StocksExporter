import Foundation

struct StockItem: Identifiable, Codable, Hashable, Sendable {
    let id: UUID
    let symbol: String
    let name: String
    let price: Double?
    let change: Double?
    let changePercent: Double?
    let marketCap: String?
    let volume: String?

    init(
        id: UUID = UUID(),
        symbol: String,
        name: String,
        price: Double? = nil,
        change: Double? = nil,
        changePercent: Double? = nil,
        marketCap: String? = nil,
        volume: String? = nil
    ) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.price = price
        self.change = change
        self.changePercent = changePercent
        self.marketCap = marketCap
        self.volume = volume
    }

    var formattedPrice: String {
        guard let price else { return "—" }
        return String(format: "$%.2f", price)
    }

    var formattedChange: String {
        guard let change else { return "—" }
        let sign = change >= 0 ? "+" : ""
        return String(format: "%@%.2f", sign, change)
    }

    var formattedChangePercent: String {
        guard let changePercent else { return "—" }
        let sign = changePercent >= 0 ? "+" : ""
        return String(format: "%@%.2f%%", sign, changePercent)
    }

    var isPositive: Bool {
        (change ?? 0) >= 0
    }
}

extension StockItem {
    static let sample = StockItem(
        symbol: "AAPL",
        name: "Apple Inc.",
        price: 185.92,
        change: 2.34,
        changePercent: 1.27,
        marketCap: "2.89T",
        volume: "52.3M"
    )

    static let samples: [StockItem] = [
        StockItem(symbol: "AAPL", name: "Apple Inc.", price: 185.92, change: 2.34, changePercent: 1.27, marketCap: "2.89T", volume: "52.3M"),
        StockItem(symbol: "GOOGL", name: "Alphabet Inc.", price: 141.80, change: -1.20, changePercent: -0.84, marketCap: "1.78T", volume: "23.1M"),
        StockItem(symbol: "MSFT", name: "Microsoft Corporation", price: 378.91, change: 4.56, changePercent: 1.22, marketCap: "2.81T", volume: "18.7M"),
        StockItem(symbol: "AMZN", name: "Amazon.com Inc.", price: 178.25, change: 3.12, changePercent: 1.78, marketCap: "1.85T", volume: "41.2M"),
        StockItem(symbol: "TSLA", name: "Tesla Inc.", price: 248.50, change: -5.30, changePercent: -2.09, marketCap: "789.2B", volume: "98.4M")
    ]
}
