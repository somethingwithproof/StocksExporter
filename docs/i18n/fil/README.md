[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Isang katutubong macOS app para i-export ang iyong listahan ng binabantayan sa Apple Stocks sa pormat na CSV o JSON.

Walang ibinibigay na opisyal na paraan ang Apple para i-export ang data ng iyong listahan ng binabantayan sa Stocks. Nilulutas ng app na ito ang problemang iyon gamit ang dalawang magkatuwang na paraan:

1. **API ng Aksesibilidad (Accessibility API)** — Binabasa nang real-time ang tumatakbong interface ng Stocks.app
2. **Cache ng Widget (Widget Cache)** — Pina-parse ang mga lokal na naka-save na cache file kapag hindi nakabukas ang app

## Mga Tampok

- **Katutubong SwiftUI interface** na may suporta para sa dark mode at RTL layout
- **Maraming pinagmulan ng data** — API ng Aksesibilidad o pag-parse ng cache
- **I-export sa CSV o JSON** na may mga hanay na maaaring i-customize
- **Paunang tingin bago mag-export** — Tingnan nang eksakto ang iyong ie-export
- **Pagpili ng hanay** — Piliin kung aling mga field ng data ang isasama
- **Kopyahin sa clipboard** — Mabilis na pag-export nang hindi nagse-save ng file
- **Nanatiling mga kagustuhan** — Tinatandaan ang iyong mga setting sa pag-export
- **Naka-localize na interface** — Magagamit sa 45 wika

## Mga Sinusuportahang Wika

Ginagamit ng Stocks Exporter ang mga kagustuhan sa wika ng macOS system at naglalaman ng kumpletong UI localization para sa 45 wika (kabilang ang awtomatikong right-to-left layout support para sa Arabic, Persian, Hebrew, at Urdu). Tingnan ang kumpletong listahan sa [English README](../../../README.md#supported-languages).

## Mga Kinakailangan

- macOS 14.0 (Sonoma) o mas bago
- Pahintulot sa Aksesibilidad (para sa live na data mula sa Stocks.app)

## Pag-build

```bash
swift build
swift run
```

O buksan sa Xcode at i-build.

## Paggamit

1. Buksan ang app
2. Ibigay ang pahintulot sa Aksesibilidad kapag hiniling (para sa live na data)
3. Buksan ang app na Apple Stocks (opsyonal, para sa pinakamagandang resulta)
4. I-click ang I-refresh upang i-load ang iyong listahan ng binabantayan
5. Pumili ng mga stock (o i-export lahat)
6. I-click ang I-export at piliin ang iyong pormat

## Privacy

Ang app na ito ay:

- Nagbabasa lamang ng data mula sa Stocks app ng Apple
- Hindi kumokonekta sa internet
- Hindi nangongolekta o nagpapadala ng anumang data
- Lokal na nagpoproseso ng lahat sa iyong Mac

## Lisensya

MIT License — tingnan ang [LICENSE](../../../LICENSE) file para sa mga detalye.
