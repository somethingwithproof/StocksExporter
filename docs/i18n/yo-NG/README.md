[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Ètò àbínibí macOS láti gbé àkójọ àmójútó Apple Stocks rẹ jáde sí ìrísí CSV tàbí JSON.

Apple kò pèsè ọ̀nà àṣẹ kankan láti gbé dátà àkójọ àmójútó Stocks rẹ jáde. Ètò yìí yanju ìṣòro náà nípa lílo ọ̀nà méjì tí ó ń ṣe àfikún ara wọn:

1. **API Ìráyèwọlé (Accessibility API)** — Ń ka ojú-ìwòye Stocks.app tí ó ń ṣiṣẹ́ ní àkókò gidi
2. **Àká Ìpamọ́ Wíjẹ́ẹ̀tì (Widget Cache)** — Ń túpalẹ̀ àwọn fáìlì àká ìpamọ́ tí a tọ́jú sí orí ẹ̀rọ nígbà tí ètò náà kò bá ṣiṣẹ́

## Àwọn Ànímọ́

- **Ojú-ìwòye SwiftUI àbínibí** pẹ̀lú àtìlẹ́yìn ipò òkùnkùn àti ètò ìṣètò RTL
- **Orísun dátà púpọ̀** — API Ìráyèwọlé tàbí ìtúpalẹ̀ àká ìpamọ́
- **Ìgbéjáde sí CSV tàbí JSON** pẹ̀lú àwọn òpó tí a lè ṣàtúnṣe
- **Àwòkọ́kọ́ kí o tó gbé jáde** — Wo ohun tí o ń gbé jáde gan-an
- **Yíyan àwọn òpó** — Yan àwọn pápá dátà láti fi kún un
- **Dà kọ sí àká àwòkọ** — Ìgbéjáde kíákíá láìfi fáìlì pamọ́
- **Àwọn àṣàyàn alálàápọn** — Rántí àwọn ètò ìgbéjáde rẹ
- **Ojú-ìwòye tí a túmọ̀** — Ó wà ní èdè 45

## Àwọn Èdè Tí A Ṣètìlẹ́yìn Fún

Stocks Exporter ń lo àwọn àṣàyàn èdè ẹ̀rọ macOS ó sì ní ìtumọ̀ ojú-ìwòye kíkún fún èdè 45 (pẹ̀lú àtìlẹ́yìn ètò láti ọ̀tún sí òsì aládàáṣe fún Lárúbáwá, Pẹ́ṣíà, Hébérù, àti Úrdù). Wo àkójọ kíkún nínú [README Èdè Gẹ̀ẹ́sì](../../../README.md#supported-languages).

## Àwọn Ohun Tí A Nílò

- macOS 14.0 (Sonoma) tàbí tuntun jù bẹ́ẹ̀ lọ
- Àṣẹ Ìráyèwọlé (fún dátà lọ́wọ́lọ́wọ́ láti Stocks.app)

## Kíkọ́ Ètò Náà

```bash
swift build
swift run
```

Tàbí ṣí i nínú Xcode kí o kọ́ ọ.

## Ìlò

1. Ṣí ètò náà
2. Fún ní àṣẹ Ìráyèwọlé nígbà tí a bá béèrè (fún dátà lọ́wọ́lọ́wọ́)
3. Ṣí ètò Apple Stocks (àṣàyàn, fún èsì tó dára jù lọ)
4. Tẹ Sọ dọ̀tun láti gbé àkójọ àmójútó rẹ wọlé
5. Yan àwọn ìpín ọjà (tàbí gbé gbogbo rẹ̀ jáde)
6. Tẹ Gbé jáde kí o sì yan ìrísí rẹ

## Àṣírí

Ètò yìí:

- Ń ka dátà láti ètò Apple Stocks nìkan
- Kò sopọ̀ mọ́ íntánẹ́ẹ̀tì
- Kò kó jọ tàbí fi dátà kankan ránṣẹ́
- Gbogbo ìṣiṣẹ́ ń wáyé ní abẹ́lé lórí Mac rẹ

## Ìwé-àṣẹ

Ìwé-àṣẹ MIT — wo fáìlì [LICENSE](../../../LICENSE) fún àlàyé kíkún.
