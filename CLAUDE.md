# CLAUDE.md

macOS app to export Apple Stocks watchlist to CSV/JSON formats.

## Stack
- Swift 5.9+
- SwiftUI
- macOS 14.0+ (Sonoma)

## Build & Test
```bash
swift build
swift run
```

Or build in Xcode.

## How It Works
- Reads Stocks.app via Accessibility API (requires permission)
- Fallback: Parses widget cache files when app closed
- No network access, all local processing

## Features
- CSV/JSON export with column selection
- Preview before export
- Copy to clipboard
- Persistent preferences
