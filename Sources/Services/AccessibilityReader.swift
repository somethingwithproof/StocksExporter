import AppKit
import ApplicationServices

enum AccessibilityError: LocalizedError {
    case notAuthorized
    case stocksAppNotRunning
    case couldNotGetApplication
    case couldNotFindWatchlist
    case parsingFailed(String)

    var errorDescription: String? {
        switch self {
        case .notAuthorized:
            return "Accessibility access not authorized. Please enable in System Settings > Privacy & Security > Accessibility."
        case .stocksAppNotRunning:
            return "Stocks app is not running. Please open the Stocks app first."
        case .couldNotGetApplication:
            return "Could not connect to Stocks app."
        case .couldNotFindWatchlist:
            return "Could not find watchlist data in Stocks app."
        case .parsingFailed(let detail):
            return "Failed to parse stock data: \(detail)"
        }
    }
}

final class AccessibilityReader: @unchecked Sendable {
    static let shared = AccessibilityReader()

    private init() {}

    var isAuthorized: Bool {
        AXIsProcessTrusted()
    }

    func requestAuthorization() {
        let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
        AXIsProcessTrustedWithOptions(options)
    }

    func isStocksAppRunning() -> Bool {
        NSWorkspace.shared.runningApplications.contains { app in
            app.bundleIdentifier == "com.apple.stocks"
        }
    }

    func launchStocksApp() {
        NSWorkspace.shared.launchApplication("Stocks")
    }

    func readWatchlist() async throws -> [StockItem] {
        guard isAuthorized else {
            throw AccessibilityError.notAuthorized
        }

        guard isStocksAppRunning() else {
            throw AccessibilityError.stocksAppNotRunning
        }

        guard let stocksApp = NSWorkspace.shared.runningApplications.first(where: {
            $0.bundleIdentifier == "com.apple.stocks"
        }) else {
            throw AccessibilityError.couldNotGetApplication
        }

        let appElement = AXUIElementCreateApplication(stocksApp.processIdentifier)

        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let stocks = try self.extractStocksFromElement(appElement)
                    continuation.resume(returning: stocks)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func extractStocksFromElement(_ element: AXUIElement) throws -> [StockItem] {
        var stocks: [StockItem] = []

        let tableRows = findTableRows(in: element)

        for row in tableRows {
            if let stock = parseRowAsStock(row) {
                stocks.append(stock)
            }
        }

        if stocks.isEmpty {
            let fallbackStocks = try extractUsingTextSearch(element)
            if !fallbackStocks.isEmpty {
                return fallbackStocks
            }
        }

        return stocks
    }

    private func findTableRows(in element: AXUIElement) -> [AXUIElement] {
        var rows: [AXUIElement] = []

        var role: CFTypeRef?
        AXUIElementCopyAttributeValue(element, kAXRoleAttribute as CFString, &role)

        if let roleStr = role as? String {
            if roleStr == kAXRowRole as String || roleStr == kAXCellRole as String {
                rows.append(element)
            }
            if roleStr == kAXTableRole as String || roleStr == kAXOutlineRole as String {
                var children: CFTypeRef?
                AXUIElementCopyAttributeValue(element, kAXRowsAttribute as CFString, &children)
                if let childArray = children as? [AXUIElement] {
                    rows.append(contentsOf: childArray)
                    return rows
                }
            }
        }

        var children: CFTypeRef?
        AXUIElementCopyAttributeValue(element, kAXChildrenAttribute as CFString, &children)

        if let childArray = children as? [AXUIElement] {
            for child in childArray {
                rows.append(contentsOf: findTableRows(in: child))
            }
        }

        return rows
    }

    private func parseRowAsStock(_ row: AXUIElement) -> StockItem? {
        let texts = collectTextValues(from: row)

        guard texts.count >= 2 else { return nil }

        var symbol: String?
        var name: String?
        var price: Double?
        var change: Double?
        var changePercent: Double?

        for text in texts {
            let trimmed = text.trimmingCharacters(in: .whitespaces)

            if symbol == nil, isValidSymbol(trimmed) {
                symbol = trimmed
                continue
            }

            if symbol != nil, name == nil, !trimmed.isEmpty, Double(trimmed.replacingOccurrences(of: ",", with: "")) == nil {
                name = trimmed
                continue
            }

            if let parsed = parsePrice(trimmed), price == nil {
                price = parsed
                continue
            }

            if let parsed = parseChange(trimmed), change == nil {
                change = parsed
                continue
            }

            if let parsed = parsePercent(trimmed), changePercent == nil {
                changePercent = parsed
            }
        }

        guard let sym = symbol else { return nil }

        return StockItem(
            symbol: sym,
            name: name ?? sym,
            price: price,
            change: change,
            changePercent: changePercent
        )
    }

    private func collectTextValues(from element: AXUIElement) -> [String] {
        var texts: [String] = []

        var value: CFTypeRef?
        AXUIElementCopyAttributeValue(element, kAXValueAttribute as CFString, &value)
        if let str = value as? String, !str.isEmpty {
            texts.append(str)
        }

        var title: CFTypeRef?
        AXUIElementCopyAttributeValue(element, kAXTitleAttribute as CFString, &title)
        if let str = title as? String, !str.isEmpty {
            texts.append(str)
        }

        var desc: CFTypeRef?
        AXUIElementCopyAttributeValue(element, kAXDescriptionAttribute as CFString, &desc)
        if let str = desc as? String, !str.isEmpty {
            texts.append(str)
        }

        var children: CFTypeRef?
        AXUIElementCopyAttributeValue(element, kAXChildrenAttribute as CFString, &children)
        if let childArray = children as? [AXUIElement] {
            for child in childArray {
                texts.append(contentsOf: collectTextValues(from: child))
            }
        }

        return texts
    }

    private func extractUsingTextSearch(_ element: AXUIElement) throws -> [StockItem] {
        let allTexts = collectTextValues(from: element)

        var stocks: [StockItem] = []

        var currentSymbol: String?
        var currentName: String?
        var currentPrice: Double?

        for text in allTexts {
            let trimmed = text.trimmingCharacters(in: .whitespaces)

            if isValidSymbol(trimmed) {
                if let sym = currentSymbol {
                    stocks.append(StockItem(
                        symbol: sym,
                        name: currentName ?? sym,
                        price: currentPrice
                    ))
                }
                currentSymbol = trimmed
                currentName = nil
                currentPrice = nil
            } else if currentSymbol != nil, currentName == nil {
                if Double(trimmed.replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "$", with: "")) == nil {
                    currentName = trimmed
                }
            } else if let price = parsePrice(trimmed), currentPrice == nil {
                currentPrice = price
            }
        }

        if let sym = currentSymbol {
            stocks.append(StockItem(
                symbol: sym,
                name: currentName ?? sym,
                price: currentPrice
            ))
        }

        return stocks
    }

    private func parsePrice(_ text: String) -> Double? {
        let cleaned = text
            .replacingOccurrences(of: "$", with: "")
            .replacingOccurrences(of: ",", with: "")
            .trimmingCharacters(in: .whitespaces)
        return Double(cleaned)
    }

    private func parseChange(_ text: String) -> Double? {
        let cleaned = text
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: ",", with: "")
            .trimmingCharacters(in: .whitespaces)

        if text.contains("%") { return nil }
        return Double(cleaned)
    }

    private func parsePercent(_ text: String) -> Double? {
        guard text.contains("%") else { return nil }
        let cleaned = text
            .replacingOccurrences(of: "%", with: "")
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .trimmingCharacters(in: .whitespaces)
        return Double(cleaned)
    }

    private func isValidSymbol(_ text: String) -> Bool {
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        guard trimmed.count >= 1 && trimmed.count <= 5 else { return false }
        return trimmed.allSatisfy { $0.isUppercase && $0.isLetter }
    }
}
