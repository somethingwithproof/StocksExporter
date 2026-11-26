[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Manhajar macOS ta asali don fitar da jerin kallon Apple Stocks ɗinka zuwa tsarin CSV ko JSON.

Apple ba ya samar da wata hanya ta hukuma don fitar da bayanan jerin kallon Stocks ɗinka. Wannan manhajar tana magance wannan matsalar ta amfani da hanyoyi biyu masu taimaka wa juna:

1. **Accessibility API** — Yana karanta fuskar manhajar Stocks.app da ke aiki a ainihin lokaci
2. **Ma'ajiyar Wucin-gadi ta Widget (Widget Cache)** — Yana tantance fayilolin ma'ajiyar wucin-gadi da aka adana a kwamfuta lokacin da manhajar ba ta aiki

## Siffofi

- **Fuskar SwiftUI ta asali** mai goyon bayan yanayin duhu da tsarin RTL
- **Tushen bayanai da dama** — Accessibility API ko tantance ma'ajiyar wucin-gadi
- **Fitarwa zuwa CSV ko JSON** tare da rukunai masu daidaitawa
- **Samfoti kafin fitarwa** — Duba ainihin abin da za ka fitar
- **Zaɓin rukunai** — Zaɓi bayanan da za a haɗa
- **Kwafa zuwa allo na wucin-gadi** — Fitarwa mai sauri ba tare da adana fayil ba
- **Zaɓuɓɓuka masu ɗorewa** — Yana tuna saitunan fitarwarka
- **Fuskar mai amfani cikin harsuna daban-daban** — Akwai cikin harsuna 45

## Harsunan da Ake Goyon Baya

Stocks Exporter yana amfani da zaɓin harshen tsarin macOS kuma ya ƙunshi cikakkiyar fassarar harsuna 45 (haɗe da goyon bayan tsarin dama-zuwa-hagu ta atomatik don Larabci, Farisanci, Ibrananci, da Urdu). Duba cikakken jerin a cikin [README na Turanci](../../../README.md#supported-languages).

## Abubuwan da Ake Buƙata

- macOS 14.0 (Sonoma) ko sabo fiye da haka
- Izinin Samun Dama (don bayanai kai tsaye daga Stocks.app)

## Gina Manhajar

```bash
swift build
swift run
```

Ko buɗe a cikin Xcode ka gina.

## Amfani

1. Buɗe manhajar
2. Ba da izinin Samun Dama lokacin da aka buƙata (don bayanai kai tsaye)
3. Buɗe manhajar Apple Stocks (na zaɓi, don mafi kyawun sakamako)
4. Danna Sabunta don loda jerin kallonka
5. Zaɓi hannun jari (ko fitar da duka)
6. Danna Fitar ka zaɓi tsarinka

## Sirri

Wannan manhajar:

- Tana karanta bayanai ne kawai daga manhajar Apple Stocks
- Ba ta haɗuwa da intanet
- Ba ta tattara ko aika kowane bayani ba
- Dukkan sarrafawa yana faruwa ne a cikin Mac ɗinka kaɗai

## Lasisi

Lasisi na MIT — duba fayil ɗin [LICENSE](../../../LICENSE) don ƙarin bayani.
