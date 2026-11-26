[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

'n Inheemse macOS-toepassing om jou Apple Stocks-dophoulys na CSV- of JSON-formaat uit te voer.

Apple bied geen amptelike manier om jou Stocks-dophoulysdata uit te voer nie. Hierdie toepassing los daardie probleem op met twee aanvullende metodes:

1. **Toeganklikheids-API** – Lees die lopende Stocks.app-koppelvlak intyds
2. **Legstukkas** – Ontleed plaaslik gestoorde kaslêers wanneer die toepassing nie loop nie

## Kenmerke

- **Inheemse SwiftUI-koppelvlak** met donkermodus- en RTL-uitlegondersteuning
- **Veelvuldige databronne** – Toeganklikheids-API of kasontleding
- **Uitvoer na CSV of JSON** met aanpasbare kolomme
- **Voorskou voor uitvoer** – Sien presies wat jy uitvoer
- **Kolomkeuse** – Kies watter datavelde ingesluit moet word
- **Kopieer na knipbord** – Vinnige uitvoer sonder om 'n lêer te stoor
- **Volhardende voorkeure** – Onthou jou uitvoerinstellings
- **Gelokaliseerde koppelvlak** – Beskikbaar in 45 tale

## Ondersteunde tale

Stocks Exporter gebruik macOS-stelseltaalvoorkeure en sluit volledige koppelvlak-lokalisering vir 45 tale in (insluitend outomatiese regs-na-links-uitlegondersteuning vir Arabies, Persies, Hebreeus en Oerdoe). Sien die volledige lys in die [Engelse README](../../../README.md#supported-languages).

## Vereistes

- macOS 14.0 (Sonoma) of nuwer
- Toeganklikheidstoestemming (vir intydse data uit Stocks.app)

## Bou

```bash
swift build
swift run
```

Of maak dit in Xcode oop en bou dit.

## Gebruik

1. Open die toepassing
2. Gee Toeganklikheidstoestemming wanneer gevra (vir intydse data)
3. Open die Apple Stocks-toepassing (opsioneel, vir beste resultate)
4. Klik Verfris om jou dophoulys te laai
5. Kies aandele (of voer alles uit)
6. Klik Voer uit en kies jou formaat

## Privaatheid

Hierdie toepassing:

- Lees slegs data uit Apple se Stocks-toepassing
- Koppel nie aan die internet nie
- Versamel of stuur geen data nie
- Doen alle verwerking plaaslik op jou Mac

## Lisensie

MIT-lisensie – sien die [LICENSE](../../../LICENSE)-lêer vir besonderhede.
