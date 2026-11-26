// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import Foundation
import XCTest
@testable import StocksExporter

final class LocalizationTests: XCTestCase {
    private static let placeholderRegex = try! NSRegularExpression(pattern: "%(?:\\d+\\$)?(?:lld|@)")

    private func placeholders(in text: String) -> [String] {
        let range = NSRange(text.startIndex..<text.endIndex, in: text)
        return Self.placeholderRegex.matches(in: text, range: range).compactMap { match in
            Range(match.range, in: text).map { String(text[$0]) }
        }.sorted()
    }

    private func loadStrings(for localization: String) -> [String: String]? {
        guard let bundle = L10n.bundle(for: localization),
              let url = bundle.url(forResource: "Localizable", withExtension: "strings"),
              let dict = NSDictionary(contentsOf: url) as? [String: String]
        else {
            return nil
        }
        return dict
    }

    func testAllTwentyLocalizationsPresent() {
        XCTAssertEqual(L10n.supportedLocalizations.count, 20)
        for code in L10n.supportedLocalizations {
            XCTAssertNotNil(
                L10n.bundle(for: code),
                "Missing localization bundle for \(code)"
            )
        }
    }

    func testAllKeysPresentNonEmptyAndPreservePlaceholders() throws {
        let english = try XCTUnwrap(loadStrings(for: "en"), "English Localizable.strings missing")
        XCTAssertGreaterThanOrEqual(english.count, 68)

        for code in L10n.supportedLocalizations {
            let localized = try XCTUnwrap(loadStrings(for: code), "Missing Localizable.strings for \(code)")
            XCTAssertEqual(
                Set(localized.keys),
                Set(english.keys),
                "Key set mismatch for \(code)"
            )

            for (key, enValue) in english {
                let value = try XCTUnwrap(localized[key], "Missing key \(key) in \(code)")
                XCTAssertFalse(
                    value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                    "Empty value for \(key) in \(code)"
                )
                XCTAssertEqual(
                    placeholders(in: value),
                    placeholders(in: enValue),
                    "Placeholder mismatch for \(key) in \(code): got \(value)"
                )
            }
        }
    }

    func testDefaultEnglishStringsUnchanged() {
        XCTAssertEqual(L10n.string("menu.export_csv", localization: "en"), "Export as CSV...")
        XCTAssertEqual(L10n.string("export.title", localization: "en"), "Export Watchlist")
        XCTAssertEqual(
            L10n.string("error.stocks_not_running", localization: "en"),
            "Stocks app is not running. Please open the Stocks app first."
        )
    }

    func testFormatPlaceholdersWorkInAllLocales() {
        for code in L10n.supportedLocalizations {
            let stocksCount = L10n.string("list.stocks_count", localization: code)
            XCTAssertNotNil(stocksCount)
            if let template = stocksCount {
                let formatted = String(format: template, Int64(12))
                XCTAssertTrue(formatted.contains("12"), "Formatted string missing count in \(code): \(formatted)")
            }
        }
    }
}
