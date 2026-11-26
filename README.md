# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

A native macOS app to export your Apple Stocks watchlist to CSV or JSON format.

Apple provides no official way to export your Stocks watchlist data. This app solves that problem using two complementary methods:

1. **Accessibility API** - Reads the running Stocks.app interface in real-time
2. **Widget Cache** - Parses locally stored cache files when the app isn't running

## Features

- **Native SwiftUI interface** with dark mode and RTL layout support
- **Multiple data sources** - Accessibility API or cache parsing
- **Export to CSV or JSON** with customizable columns
- **Preview before export** - See exactly what you're exporting
- **Column selection** - Choose which data fields to include
- **Copy to clipboard** - Quick export without saving a file
- **Persistent preferences** - Remember your export settings
- **Localized interface** - Available in 45 languages

## Supported Languages

Stocks Exporter uses macOS system language preferences and includes full UI localizations for 45 languages (including automatic right-to-left layout support for Arabic, Persian, Hebrew, and Urdu) along with localized READMEs:

| Language | Locale | README | Language | Locale | README |
| --- | --- | --- | --- | --- | --- |
| English | `en` | [README](./README.md) | Afrikaans | `af-ZA` | [Afrikaans](./docs/i18n/af-ZA/README.md) |
| Deutsch | `de` | [Deutsch](./docs/i18n/de/README.md) | አማርኛ | `am-ET` | [አማርኛ](./docs/i18n/am-ET/README.md) |
| Español | `es` | [Español](./docs/i18n/es/README.md) | العربية (مصر) | `ar-EG` | [العربية (مصر)](./docs/i18n/ar-EG/README.md) |
| Français | `fr` | [Français](./docs/i18n/fr/README.md) | العربية (المغرب) | `ar-MA` | [العربية (المغرب)](./docs/i18n/ar-MA/README.md) |
| Italiano | `it` | [Italiano](./docs/i18n/it/README.md) | Français (Maroc) | `fr-MA` | [Français (Maroc)](./docs/i18n/fr-MA/README.md) |
| Português (Brasil) | `pt-BR` | [Português (Brasil)](./docs/i18n/pt-BR/README.md) | Français (Sénégal) | `fr-SN` | [Français (Sénégal)](./docs/i18n/fr-SN/README.md) |
| Nederlands | `nl` | [Nederlands](./docs/i18n/nl/README.md) | Hausa | `ha-NG` | [Hausa](./docs/i18n/ha-NG/README.md) |
| Русский | `ru` | [Русский](./docs/i18n/ru/README.md) | Igbo | `ig-NG` | [Igbo](./docs/i18n/ig-NG/README.md) |
| Українська | `uk` | [Українська](./docs/i18n/uk/README.md) | Malagasy | `mg-MG` | [Malagasy](./docs/i18n/mg-MG/README.md) |
| 日本語 | `ja` | [日本語](./docs/i18n/ja/README.md) | Kinyarwanda | `rw-RW` | [Kinyarwanda](./docs/i18n/rw-RW/README.md) |
| 한국어 | `ko` | [한국어](./docs/i18n/ko/README.md) | Soomaali | `so-SO` | [Soomaali](./docs/i18n/so-SO/README.md) |
| 简体中文 | `zh-Hans` / `zh-CN` | [简体中文](./docs/i18n/zh-CN/README.md) | Kiswahili | `sw-KE` | [Kiswahili](./docs/i18n/sw-KE/README.md) |
| 繁體中文 | `zh-Hant` / `zh-TW` | [繁體中文](./docs/i18n/zh-TW/README.md) | isiXhosa | `xh-ZA` | [isiXhosa](./docs/i18n/xh-ZA/README.md) |
| العربية | `ar` | [العربية](./docs/i18n/ar/README.md) | Yorùbá | `yo-NG` | [Yorùbá](./docs/i18n/yo-NG/README.md) |
| हिन्दी | `hi` | [हिन्दी](./docs/i18n/hi/README.md) | isiZulu | `zu-ZA` | [isiZulu](./docs/i18n/zu-ZA/README.md) |
| Polski | `pl` | [Polski](./docs/i18n/pl/README.md) | বাংলা | `bn` | [বাংলা](./docs/i18n/bn/README.md) |
| Türkçe | `tr` | [Türkçe](./docs/i18n/tr/README.md) | فارسی | `fa` | [فارسی](./docs/i18n/fa/README.md) |
| Svenska | `sv` | [Svenska](./docs/i18n/sv/README.md) | עברית | `he` | [עברית](./docs/i18n/he/README.md) |
| Tiếng Việt | `vi` | [Tiếng Việt](./docs/i18n/vi/README.md) | मराठी | `mr` | [मराठी](./docs/i18n/mr/README.md) |
| Bahasa Indonesia | `id` | [Bahasa Indonesia](./docs/i18n/id/README.md) | தமிழ் | `ta` | [தமிழ்](./docs/i18n/ta/README.md) |
| తెలుగు | `te` | [తెలుగు](./docs/i18n/te/README.md) | ไทย | `th` | [ไทย](./docs/i18n/th/README.md) |
| اردو | `ur` | [اردو](./docs/i18n/ur/README.md) | Bahasa Melayu | `ms` | [Bahasa Melayu](./docs/i18n/ms/README.md) |
| Filipino | `fil` | [Filipino](./docs/i18n/fil/README.md) | | | |

## Requirements

- macOS 14.0 (Sonoma) or later
- Accessibility permission (for live data from Stocks.app)

## Building

```bash
swift build
swift run
```

Or open in Xcode and build.

## Usage

1. Launch the app
2. Grant Accessibility permission when prompted (for live data)
3. Open Apple Stocks app (optional, for best results)
4. Click Refresh to load your watchlist
5. Select stocks (or export all)
6. Click Export and choose your format

## Privacy

This app:

- Only reads data from Apple's Stocks app
- Does not connect to the internet
- Does not collect or transmit any data
- All processing happens locally on your Mac

## License

MIT License - see [LICENSE](./LICENSE) file for details.
