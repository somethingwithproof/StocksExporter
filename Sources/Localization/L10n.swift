// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import Foundation
import SwiftUI

enum L10n {
    /// All 48 supported Apple localization identifiers shipped in Resources.
    static let supportedLocalizations: [String] = [
        // Phase 1 (20)
        "en",
        "de",
        "es",
        "fr",
        "it",
        "pt-BR",
        "nl",
        "ru",
        "uk",
        "ja",
        "ko",
        "zh-Hans",
        "zh-Hant",
        "ar",
        "hi",
        "pl",
        "tr",
        "sv",
        "vi",
        "id",
        // Phase 2 African (15)
        "af-ZA",
        "am-ET",
        "ar-EG",
        "ar-MA",
        "fr-MA",
        "fr-SN",
        "ha-NG",
        "ig-NG",
        "mg-MG",
        "rw-RW",
        "so-SO",
        "sw-KE",
        "xh-ZA",
        "yo-NG",
        "zu-ZA",
        // Phase 2 Asian (10)
        "bn",
        "fa",
        "he",
        "mr",
        "ta",
        "te",
        "th",
        "ur",
        "ms",
        "fil",
        // Phase 3 South Slavic (3)
        "bs",
        "hr",
        "sr"
    ]

    /// All 6 right-to-left localization identifiers shipped in Resources.
    static let rtlLocalizations: Set<String> = [
        "ar",
        "ar-EG",
        "ar-MA",
        "fa",
        "he",
        "ur"
    ]

    private static let rtlLanguageCodes: Set<String> = ["ar", "fa", "he", "ur"]

    static func isRTL(_ localization: String) -> Bool {
        let normalized = localization
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "_", with: "-")
            .lowercased()
        guard !normalized.isEmpty else {
            return false
        }
        if rtlLocalizations.contains(where: { $0.lowercased() == normalized }) {
            return true
        }
        let baseLanguage = normalized.split(separator: "-").first.map(String.init) ?? normalized
        return rtlLanguageCodes.contains(baseLanguage)
    }

    static func layoutDirection(for localization: String) -> LayoutDirection {
        isRTL(localization) ? .rightToLeft : .leftToRight
    }

    static var currentLayoutDirection: LayoutDirection {
        if let preferred = Bundle.module.preferredLocalizations.first {
            return layoutDirection(for: preferred)
        }
        if let preferred = Locale.preferredLanguages.first {
            return layoutDirection(for: preferred)
        }
        return .leftToRight
    }

    static func string(_ key: String) -> String {
        NSLocalizedString(key, tableName: "Localizable", bundle: .module, value: key, comment: "")
    }

    static func format(_ key: String, _ arguments: CVarArg...) -> String {
        let template = string(key)
        return String(format: template, locale: Locale.current, arguments: arguments)
    }

    /// Maps regional or script-tagged identifiers (such as `bs-BA`, `hr-HR`,
    /// `sr-RS`, `sr-Cyrl`, `sr-Latn`) to their bundled `.lproj` identifier.
    static func canonicalLocalization(for localization: String) -> String {
        let trimmed = localization.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return trimmed
        }
        let normalized = trimmed.replacingOccurrences(of: "_", with: "-")
        if supportedLocalizations.contains(normalized) {
            return normalized
        }
        if let exactCI = supportedLocalizations.first(where: {
            $0.caseInsensitiveCompare(normalized) == .orderedSame
        }) {
            return exactCI
        }
        let lower = normalized.lowercased()
        let base = lower.split(separator: "-").first.map(String.init) ?? lower
        switch base {
        case "bs":
            return "bs"
        case "hr":
            return "hr"
        case "sr":
            return "sr"
        default:
            return normalized
        }
    }

    /// Returns a bundle pinned to a specific `.lproj` localization for verification and lookup.
    static func bundle(for localization: String) -> Bundle? {
        let resolved = canonicalLocalization(for: localization)
        guard let path = Bundle.module.path(forResource: resolved, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }

    static func string(_ key: String, localization: String) -> String? {
        guard let localizedBundle = bundle(for: localization) else {
            return nil
        }
        let sentinel = "\u{0007}__MISSING__\u{0007}"
        let value = localizedBundle.localizedString(forKey: key, value: sentinel, table: "Localizable")
        return value == sentinel ? nil : value
    }
}
