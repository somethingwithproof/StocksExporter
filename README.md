# Stocks Exporter

A native macOS app to export your Apple Stocks watchlist to CSV or JSON format.

Apple provides no official way to export your Stocks watchlist data. This app solves that problem using two complementary methods:

1. **Accessibility API** - Reads the running Stocks.app interface in real-time
2. **Widget Cache** - Parses locally stored cache files when the app isn't running

## Features

- **Native SwiftUI interface** with dark mode support
- **Multiple data sources** - Accessibility API or cache parsing
- **Export to CSV or JSON** with customizable columns
- **Preview before export** - See exactly what you're exporting
- **Column selection** - Choose which data fields to include
- **Copy to clipboard** - Quick export without saving a file
- **Persistent preferences** - Remember your export settings

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

MIT License - see LICENSE file for details.
