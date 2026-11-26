[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Ngwa macOS mbụ maka ibupụ ndepụta nleba anya Apple Stocks gị n'ụdị CSV ma ọ bụ JSON.

Apple enyeghị ụzọ gọọmentị isi bupụ data ndepụta nleba anya Stocks gị. Ngwa a na-edozi nsogbu ahụ site n'iji ụzọ abụọ na-akwado ibe ha:

1. **API Nnwere Onwe Nnweta (Accessibility API)** — Na-agụ ihu ngwa Stocks.app na-arụ ọrụ n'oge ozugbo
2. **Ebe Nchekwa Nwa Oge nke Wijetị (Widget Cache)** — Na-akọwa faịlụ nchekwa nwa oge echekwara na kọmputa mgbe ngwa anaghị arụ ọrụ

## Njirimara

- **Ihu SwiftUI mbụ** nke na-akwado ọnọdụ ọchịchịrị na nhazi RTL
- **Ọtụtụ isi iyi data** — Accessibility API ma ọ bụ nkọwa ebe nchekwa nwa oge
- **Mbupụ gaa CSV ma ọ bụ JSON** nke nwere ogidi a pụrụ ịhazi
- **Nlele mbụ tupu mbupụ** — Hụ kpọmkwem ihe ị na-ebupụ
- **Nhọrọ ogidi** — Họrọ ubi data ị chọrọ itinye
- **Detuo na bọọdụ nchekwa** — Mbupụ ngwa ngwa na-echekwaaghị faịlụ
- **Mmasị na-adịgide adịgide** — Na-echeta ntọala mbupụ gị
- **Ihu ngwa asụgharịrị** — Dị n'asụsụ 45

## Asụsụ A Na-akwado

Stocks Exporter na-eji mmasị asụsụ sistemụ macOS ma tinye ntụgharị asụsụ zuru oke maka asụsụ 45 (gụnyere nkwado nhazi aka nri gaa aka ekpe na-akpaghị aka maka Arabic, Persian, Hebrew, na Urdu). Lee ndepụta zuru oke na [README Bekee](../../../README.md#supported-languages).

## Ihe Achọrọ

- macOS 14.0 (Sonoma) ma ọ bụ nke ọhụrụ karịa
- Ikike Nnwere Onwe Nnweta (maka data ozugbo sitere na Stocks.app)

## Iwu Ngwa

```bash
swift build
swift run
```

Ma ọ bụ mepee na Xcode ma wuo ya.

## Ojiji

1. Mepee ngwa ahụ
2. Nye ikike Nnwere Onwe Nnweta mgbe a rịọrọ gị (maka data ozugbo)
3. Mepee ngwa Apple Stocks (nhọrọ, maka nsonaazụ kacha mma)
4. Pịa Mee ka ọ dị ọhụrụ iji buo ndepụta nleba anya gị
5. Họrọ ọkwa ahịa (ma ọ bụ bupụ ha niile)
6. Pịa Bupụ ma họrọ ụdị gị

## Nzuzo

Ngwa a:

- Na-agụ naanị data sitere na ngwa Apple Stocks
- Anaghị ejikọ na ịntanetị
- Anaghị anakọta ma ọ bụ ezipụ data ọ bụla
- Nhazi niile na-eme n'ime Mac gị naanị

## Ikike

Ikike MIT — lee faịlụ [LICENSE](../../../LICENSE) maka nkọwa zuru ezu.
