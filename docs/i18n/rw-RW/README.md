[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Porogaramu y'umwimerere ya macOS yo kwohereza urutonde rwawe rwo gukurikirana rwa Apple Stocks mu miterere ya CSV cyangwa JSON.

Apple ntitanga uburyo bwemewe bwo kwohereza amakuru y'urutonde rwawe rwo gukurikirana rwa Stocks. Iyi porogaramu ikemura icyo kibazo ikoresheje uburyo bubiri bwuzuzanya:

1. **API yo Korohereza (Accessibility API)** — Isoma imigaragarire ya Stocks.app iri gukora mu gihe nyacyo
2. **Ububiko bw'Agateganyo bwa Widget (Widget Cache)** — Isesengura amadosiye y'ububiko bw'agateganyo abitswe ku mudasobwa igihe porogaramu itari gukora

## Ibiranga Porogaramu

- **Imigaragarire y'umwimerere ya SwiftUI** ifite ubushobozi bw'uburyo bwijimye n'imigaragarire ya RTL
- **Inkomoko z'amakuru nyinshi** — API yo Korohereza cyangwa isesengura ry'ububiko bw'agateganyo
- **Kwohereza muri CSV cyangwa JSON** bifite inkingi zahindurwa
- **Igaragazambere mbere yo kwohereza** — Reba neza ibyo ugiye kwohereza
- **Guhitamo inkingi** — Hitamo ibyiciro by'amakuru ushaka gushyiramo
- **Gukoporora mu bubiko bw'agateganyo** — Kwohereza byihuse utabitse dosiye
- **Amahitamo ahoraho** — Yibuka igenamiterere ryawe ryo kwohereza
- **Imigaragarire yahinduwe mu ndimi** — Iboneka mu ndimi 45

## Indimi Zishyigikiwe

Stocks Exporter ikoresha amahitamo y'ururimi rwa sisitemu ya macOS kandi ikubiyemo ihinduranyandimi ryuzuye ry'indimi 45 (harimo uburyo bwikora bwo gutondeka iburyo ujya ibumoso ku Cyarabu, Igiperesi, Igiheburayo, n'Icyurdu). Reba urutonde rwuzuye muri [README y'Icyongereza](../../../README.md#supported-languages).

## Ibisabwa

- macOS 14.0 (Sonoma) cyangwa ibishya kurushaho
- Uburenganzira bwo Korohereza (ku makuru y'ako kanya aturuka muri Stocks.app)

## Kubaka Porogaramu

```bash
swift build
swift run
```

Cyangwa ufungure muri Xcode maze wubake.

## Imikoreshereze

1. Fungura porogaramu
2. Tanga uburenganzira bwo Korohereza igihe ubisabwe (ku makuru y'ako kanya)
3. Fungura porogaramu ya Apple Stocks (si itegeko, ku musaruro mwiza kurushaho)
4. Kanda Kuvugurura kugira ngo upakurure urutonde rwawe rwo gukurikirana
5. Hitamo imigabane (cyangwa wohereze yose)
6. Kanda Kwohereza maze uhitemo imiterere

## Ibanga

Iyi porogaramu:

- Isoma amakuru gusa muri porogaramu ya Apple Stocks
- Ntiyihuza na interineti
- Ntibika cyangwa ngo yohereze amakuru ayo ari yo yose
- Ikorera imirimo yose kuri Mac yawe gusa

## Uruhushya

Uruhushya rwa MIT — reba dosiye ya [LICENSE](../../../LICENSE) ku bisobanuro birambuye.
