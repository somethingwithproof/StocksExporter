// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import Foundation

enum L10n {
    /// All 20 supported Apple localization identifiers shipped in Resources.
    static let supportedLocalizations: [String] = [
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
        "id"
    ]

    static func string(_ key: String) -> String {
        NSLocalizedString(key, tableName: "Localizable", bundle: .module, value: key, comment: "")
    }

    static func format(_ key: String, _ arguments: CVarArg...) -> String {
        let template = string(key)
        return String(format: template, locale: Locale.current, arguments: arguments)
    }

    /// Returns a bundle pinned to a specific `.lproj` localization for verification and lookup.
    static func bundle(for localization: String) -> Bundle? {
        guard let path = Bundle.module.path(forResource: localization, ofType: "lproj") else {
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
