[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

En inbyggd macOS-app för att exportera din bevakningslista från Apple Stocks till CSV- eller JSON-format.

Apple erbjuder inget officiellt sätt att exportera data från din bevakningslista i Stocks. Den här appen löser problemet med två kompletterande metoder:

1. **Hjälpmedels-API** – Läser gränssnittet i den körande Stocks-appen i realtid
2. **Widget-cache** – Tolkar lokalt lagrade cachefiler när appen inte körs

## Funktioner

- **Inbyggt SwiftUI-gränssnitt** med stöd för mörkt läge och RTL-layout
- **Flera datakällor** – Hjälpmedels-API eller cachetolkning
- **Exportera till CSV eller JSON** med anpassningsbara kolumner
- **Förhandsvisning före export** – Se exakt vad du exporterar
- **Kolumnval** – Välj vilka datafält som ska inkluderas
- **Kopiera till urklipp** – Snabb export utan att spara en fil
- **Beständiga inställningar** – Kommer ihåg dina exportinställningar
- **Lokaliserat gränssnitt** – Tillgängligt på 45 språk

## Språk som stöds

Stocks Exporter använder macOS systeminställningar för språk och innehåller fullständig lokalisering på 45 språk (inklusive automatiskt höger-till-vänster-stöd för arabiska, persiska, hebreiska och urdu). Se den fullständiga listan i den [engelska README-filen](../../../README.md#supported-languages).

## Krav

- macOS 14.0 (Sonoma) eller senare
- Behörighet för Hjälpmedel (för realtidsdata från Stocks.app)

## Bygga

```bash
swift build
swift run
```

Eller öppna i Xcode och bygg.

## Användning

1. Starta appen
2. Ge behörighet för Hjälpmedel när du tillfrågas (för realtidsdata)
3. Öppna Apple Stocks-appen (valfritt, för bästa resultat)
4. Klicka på Uppdatera för att läsa in din bevakningslista
5. Markera aktier (eller exportera alla)
6. Klicka på Exportera och välj format

## Integritet

Den här appen:

- Läser endast data från Apples Stocks-app
- Ansluter inte till internet
- Samlar inte in eller skickar någon data
- Utför all bearbetning lokalt på din Mac

## Licens

MIT-licens – se filen [LICENSE](../../../LICENSE) för mer information.
