// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import Foundation
import SwiftUI
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

    func testAllFortyEightLocalizationsPresent() {
        XCTAssertEqual(L10n.supportedLocalizations.count, 48)
        XCTAssertEqual(Set(L10n.supportedLocalizations).count, 48)
        for code in L10n.supportedLocalizations {
            XCTAssertNotNil(
                L10n.bundle(for: code),
                "Missing localization bundle for \(code)"
            )
        }
    }

    func testSouthSlavicTagResolutionAndDistinctness() throws {
        XCTAssertEqual(L10n.canonicalLocalization(for: "bs-BA"), "bs")
        XCTAssertEqual(L10n.canonicalLocalization(for: "bs_BA"), "bs")
        XCTAssertEqual(L10n.canonicalLocalization(for: "hr-HR"), "hr")
        XCTAssertEqual(L10n.canonicalLocalization(for: "hr_HR"), "hr")
        XCTAssertEqual(L10n.canonicalLocalization(for: "sr-RS"), "sr")
        XCTAssertEqual(L10n.canonicalLocalization(for: "sr-Cyrl"), "sr")
        XCTAssertEqual(L10n.canonicalLocalization(for: "sr-Latn"), "sr")
        XCTAssertEqual(L10n.canonicalLocalization(for: "sr-Cyrl-RS"), "sr")
        XCTAssertEqual(L10n.canonicalLocalization(for: "sr-Latn-RS"), "sr")

        XCTAssertEqual(L10n.string("list.error_title", localization: "bs-BA"), L10n.string("list.error_title", localization: "bs"))
        XCTAssertEqual(L10n.string("list.error_title", localization: "hr-HR"), L10n.string("list.error_title", localization: "hr"))
        XCTAssertEqual(L10n.string("list.error_title", localization: "sr-RS"), L10n.string("list.error_title", localization: "sr"))
        XCTAssertEqual(L10n.string("list.error_title", localization: "sr-Cyrl"), L10n.string("list.error_title", localization: "sr"))
        XCTAssertEqual(L10n.string("list.error_title", localization: "sr-Latn"), L10n.string("list.error_title", localization: "sr"))

        let bs = try XCTUnwrap(loadStrings(for: "bs"))
        let hr = try XCTUnwrap(loadStrings(for: "hr"))
        let sr = try XCTUnwrap(loadStrings(for: "sr"))
        XCTAssertNotEqual(bs, hr, "Bosnian and Croatian catalogs must be distinct")
        XCTAssertNotEqual(bs, sr, "Bosnian and Serbian catalogs must be distinct")
        XCTAssertNotEqual(hr, sr, "Croatian and Serbian catalogs must be distinct")
    }

    func testAllKeysPresentNonEmptyAndPreservePlaceholders() throws {
        let english = try XCTUnwrap(loadStrings(for: "en"), "English Localizable.strings missing")
        XCTAssertEqual(english.count, 68)

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

    func testRTLLocalizationsAndLayoutDirection() {
        let expectedRTL: Set<String> = ["ar", "ar-EG", "ar-MA", "fa", "he", "ur"]
        XCTAssertEqual(L10n.rtlLocalizations, expectedRTL)

        for code in L10n.supportedLocalizations {
            if expectedRTL.contains(code) {
                XCTAssertTrue(L10n.isRTL(code), "Expected \(code) to be RTL")
                XCTAssertEqual(L10n.layoutDirection(for: code), .rightToLeft, "Expected .rightToLeft for \(code)")
            } else {
                XCTAssertFalse(L10n.isRTL(code), "Expected \(code) to be LTR")
                XCTAssertEqual(L10n.layoutDirection(for: code), .leftToRight, "Expected .leftToRight for \(code)")
            }
        }

        // Verify normalization, case-insensitivity, and base-language matching
        XCTAssertTrue(L10n.isRTL("AR"))
        XCTAssertTrue(L10n.isRTL("ar_EG"))
        XCTAssertTrue(L10n.isRTL("AR-MA"))
        XCTAssertTrue(L10n.isRTL("fa_IR"))
        XCTAssertTrue(L10n.isRTL("he-IL"))
        XCTAssertTrue(L10n.isRTL("ur_PK"))
        XCTAssertFalse(L10n.isRTL("en_US"))
        XCTAssertFalse(L10n.isRTL("fr_MA"))
        XCTAssertFalse(L10n.isRTL(""))
    }

    func testDefaultEnglishStringsUnchanged() {
        XCTAssertEqual(L10n.string("menu.export_csv", localization: "en"), "Export as CSV...")
        XCTAssertEqual(L10n.string("export.title", localization: "en"), "Export Watchlist")
        XCTAssertEqual(
            L10n.string("error.stocks_not_running", localization: "en"),
            "Stocks app is not running. Please open the Stocks app first."
        )
    }

    func testFormatPlaceholdersWorkInAllLocales() throws {
        let intKeys = [
            "list.stocks_count",
            "list.selected_count",
            "export.selected_stocks"
        ]
        let stringKeys = [
            "about.version",
            "error.parsing_failed",
            "error.cache_parsing_failed"
        ]

        for code in L10n.supportedLocalizations {
            for key in intKeys {
                let template = try XCTUnwrap(
                    L10n.string(key, localization: code),
                    "Missing \(key) in \(code)"
                )
                let formatted = String(format: template, Int64(12))
                XCTAssertTrue(
                    formatted.contains("12"),
                    "Formatted \(key) missing count in \(code): \(formatted)"
                )
            }

            for key in stringKeys {
                let template = try XCTUnwrap(
                    L10n.string(key, localization: code),
                    "Missing \(key) in \(code)"
                )
                let token = "TEST_TOKEN"
                let formatted = String(format: template, token)
                XCTAssertTrue(
                    formatted.contains(token),
                    "Formatted \(key) missing token in \(code): \(formatted)"
                )
            }
        }
    }
}
