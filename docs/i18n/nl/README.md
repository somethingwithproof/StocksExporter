[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Een native macOS-app om je Apple Stocks-volglijst te exporteren naar CSV- of JSON-formaat.

Apple biedt geen officiële manier om de gegevens van je Stocks-volglijst te exporteren. Deze app lost dat probleem op met twee aanvullende methoden:

1. **Toegankelijkheids-API** – Leest de actieve interface van Stocks.app in realtime uit
2. **Widgetcache** – Parst lokaal opgeslagen cachebestanden wanneer de app niet actief is

## Functies

- **Native SwiftUI-interface** met ondersteuning voor donkere modus en RTL-lay-out
- **Meerdere gegevensbronnen** – Toegankelijkheids-API of cache-analyse
- **Exporteren naar CSV of JSON** met aanpasbare kolommen
- **Voorvertoning vóór export** – Zie precies wat je exporteert
- **Kolomselectie** – Kies welke gegevensvelden worden opgenomen
- **Kopiëren naar klembord** – Snel exporteren zonder een bestand op te slaan
- **Blijvende voorkeuren** – Onthoudt je exportinstellingen
- **Gelokaliseerde interface** – Beschikbaar in 45 talen

## Ondersteunde talen

Stocks Exporter gebruikt de systeemtaalvoorkeuren van macOS en bevat volledige lokalisaties voor 45 talen (inclusief automatische rechts-naar-links-indeling voor Arabisch, Perzisch, Hebreeuws en Urdu). Bekijk het volledige overzicht in de [Engelse README](../../../README.md#supported-languages).

## Vereisten

- macOS 14.0 (Sonoma) of nieuwer
- Toegankelijkheidsmachtiging (voor livegegevens uit Stocks.app)

## Bouwen

```bash
swift build
swift run
```

Of open het project in Xcode en bouw het daar.

## Gebruik

1. Start de app
2. Verleen toegang voor Toegankelijkheid wanneer daarom wordt gevraagd (voor livegegevens)
3. Open de Apple Stocks-app (optioneel, voor het beste resultaat)
4. Klik op Vernieuw om je volglijst te laden
5. Selecteer aandelen (of exporteer alles)
6. Klik op Exporteer en kies het gewenste formaat

## Privacy

Deze app:

- Leest alleen gegevens uit de Stocks-app van Apple
- Maakt geen verbinding met internet
- Verzamelt of verzendt geen gegevens
- Verwerkt alles lokaal op je Mac

## Licentie

MIT-licentie – zie het bestand [LICENSE](../../../LICENSE) voor meer informatie.
