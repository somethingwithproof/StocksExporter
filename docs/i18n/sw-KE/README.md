[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Programu asili ya macOS ya kuhamisha orodha yako ya ufuatiliaji ya Apple Stocks kwenda muundo wa CSV au JSON.

Apple haitoi njia rasmi ya kuhamisha data ya orodha yako ya ufuatiliaji ya Stocks. Programu hii hutatua tatizo hilo kwa kutumia mbinu mbili zinazokamilishana:

1. **API ya Ufikivu (Accessibility API)** — Husoma kiolesura cha Stocks.app kinachoendesha kwa wakati halisi
2. **Kache ya Wijeti (Widget Cache)** — Huchanganua faili za kache zilizohifadhiwa ndani wakati programu haifanyi kazi

## Vipengele

- **Kiolesura asili cha SwiftUI** chenye usaidizi wa hali ya giza na mpangilio wa RTL
- **Vyanzo vingi vya data** — API ya Ufikivu au uchanganuzi wa kache
- **Uhamishaji kwenda CSV au JSON** na safuwima zinazoweza kubinafsishwa
- **Onyesho la awali kabla ya kuhamisha** — Ona hasa unachohamisha
- **Uchaguzi wa safuwima** — Chagua sehemu za data za kujumuisha
- **Nakili kwenye ubao wa kunakili** — Uhamishaji wa haraka bila kuhifadhi faili
- **Mapendeleo endelevu** — Hukumbuka mipangilio yako ya uhamishaji
- **Kiolesura kilichotafsiriwa** — Inapatikana katika lugha 45

## Lugha Zinazotumika

Stocks Exporter hutumia mapendeleo ya lugha ya mfumo wa macOS na inajumuisha tafsiri kamili ya kiolesura kwa lugha 45 (ikiwa ni pamoja na usaidizi wa kiotomatiki wa mpangilio wa kulia-kwenda-kushoto kwa Kiarabu, Kiajemi, Kiebrania, na Kiurdu). Tazama orodha kamili katika [README ya Kiingereza](../../../README.md#supported-languages).

## Mahitaji

- macOS 14.0 (Sonoma) au toleo jipya zaidi
- Ruhusa ya Ufikivu (kwa data ya moja kwa moja kutoka Stocks.app)

## Kujenga Programu

```bash
swift build
swift run
```

Au fungua katika Xcode na ujenge.

## Matumizi

1. Fungua programu
2. Toa ruhusa ya Ufikivu unapoombwa (kwa data ya moja kwa moja)
3. Fungua programu ya Apple Stocks (hiari, kwa matokeo bora zaidi)
4. Bofya Onyesha upya ili kupakia orodha yako ya ufuatiliaji
5. Chagua hisa (au hamisha zote)
6. Bofya Hamisha kisha chagua muundo wako

## Faragha

Programu hii:

- Husoma data kutoka programu ya Apple Stocks pekee
- Haiunganishi na intaneti
- Haikusanyi wala kutuma data yoyote
- Uchakataji wote hufanyika ndani ya Mac yako

## Leseni

Leseni ya MIT — tazama faili ya [LICENSE](../../../LICENSE) kwa maelezo zaidi.
