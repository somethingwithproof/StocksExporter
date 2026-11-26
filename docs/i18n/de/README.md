[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Eine native macOS-App zum Exportieren Ihrer Apple Stocks-Watchlist im CSV- oder JSON-Format.

Apple bietet keine offizielle Möglichkeit, Ihre Stocks-Watchlist-Daten zu exportieren. Diese App löst das Problem mit zwei sich ergänzenden Methoden:

1. **Bedienungshilfen-API** – Liest die laufende Stocks.app-Oberfläche in Echtzeit aus
2. **Widget-Cache** – Parst lokal gespeicherte Cache-Dateien, wenn die App nicht ausgeführt wird

## Funktionen

- **Native SwiftUI-Oberfläche** mit Unterstützung für den Dunkelmodus und RTL-Layouts
- **Mehrere Datenquellen** – Bedienungshilfen-API oder Cache-Analyse
- **Export nach CSV oder JSON** mit anpassbaren Spalten
- **Vorschau vor dem Export** – Sehen Sie genau, was exportiert wird
- **Spaltenauswahl** – Wählen Sie die einzubeziehenden Datenfelder aus
- **In die Zwischenablage kopieren** – Schneller Export ohne Speichern einer Datei
- **Dauerhafte Einstellungen** – Speichert Ihre Exporteinstellungen
- **Lokalisierte Oberfläche** – Verfügbar in 45 Sprachen

## Unterstützte Sprachen

Stocks Exporter verwendet die macOS-Systemspracheinstellungen und enthält vollständige Lokalisierungen für 45 Sprachen (einschließlich automatischer Rechts-nach-links-Unterstützung für Arabisch, Persisch, Hebräisch und Urdu). Die vollständige Sprachübersicht finden Sie in der [englischen README](../../../README.md#supported-languages).

## Voraussetzungen

- macOS 14.0 (Sonoma) oder neuer
- Berechtigung für Bedienungshilfen (für Live-Daten aus Stocks.app)

## Kompilieren

```bash
swift build
swift run
```

Oder in Xcode öffnen und erstellen.

## Verwendung

1. App starten
2. Berechtigung für Bedienungshilfen erteilen, wenn Sie dazu aufgefordert werden (für Live-Daten)
3. Apple Stocks-App öffnen (optional, für beste Ergebnisse)
4. Auf „Aktualisieren“ klicken, um Ihre Watchlist zu laden
5. Aktien auswählen (oder alle exportieren)
6. Auf „Exportieren“ klicken und das gewünschte Format wählen

## Datenschutz

Diese App:

- Liest ausschließlich Daten aus Apples Stocks-App
- Stellt keine Verbindung zum Internet her
- Erfasst oder überträgt keinerlei Daten
- Verarbeitet alle Daten lokal auf Ihrem Mac

## Lizenz

MIT-Lizenz – Details finden Sie in der Datei [LICENSE](../../../LICENSE).
