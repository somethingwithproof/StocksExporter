[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Uhlelo lwendabuko lwe-macOS lokukhipha uhlu lwakho lokubuka lwe-Apple Stocks uye kufomethi ye-CSV noma ye-JSON.

I-Apple ayinikezi indlela esemthethweni yokukhipha idatha yohlu lwakho lokubuka lwe-Stocks. Lolu hlelo luxazulula leyo nkinga ngokusebenzisa izindlela ezimbili ezihambisanayo:

1. **I-API Yokufinyeleleka (Accessibility API)** — Ifunda isixhumi esibonakalayo se-Stocks.app esisebenzayo ngesikhathi sangempela
2. **Isilondolozi Sesikhashana Sewijethi (Widget Cache)** — Ihlaziya amafayela esilondolozi sesikhashana agcinwe endaweni lapho uhlelo lungasebenzi

## Izici

- **Isixhumi esibonakalayo sendabuko se-SwiftUI** eseseka imodi emnyama nesakhiwo se-RTL
- **Imithombo eminingi yedatha** — I-API Yokufinyeleleka noma ukuhlaziywa kwesilondolozi sesikhashana
- **Ukukhipha ku-CSV noma ku-JSON** ngamakholomu alungisekayo
- **Ukubuka kuqala ngaphambi kokukhipha** — Bona kahle okukhiphayo
- **Ukukhetha amakholomu** — Khetha izinkambu zedatha okufanele zifakwe
- **Kopisha ebhodini lokunameka** — Ukukhipha okusheshayo ngaphandle kokulondoloza ifayela
- **Izintandokazi eziqhubekayo** — Ikhumbula izilungiselelo zakho zokukhipha
- **Isixhumi esibonakalayo esihunyushiwe** — Sitholakala ngezilimi ezingama-45

## Izilimi Ezisekelwayo

I-Stocks Exporter isebenzisa izintandokazi zolimi lwesistimu ye-macOS futhi ihlanganisa ukuhunyushwa okuphelele kwezilimi ezingama-45 (kuhlanganise nosekelo oluzenzakalelayo lwesakhiwo sesokudla kuya kwesokunxele sesi-Arabhu, isiPheresiya, isiHebheru, nesi-Urdu). Bona uhlu oluphelele ku-[README yesiNgisi](../../../README.md#supported-languages).

## Izidingo

- macOS 14.0 (Sonoma) noma entsha
- Imvume Yokufinyeleleka (yedatha ebukhoma evela ku-Stocks.app)

## Ukwakha

```bash
swift build
swift run
```

Noma vula ku-Xcode bese uyakha.

## Ukusetshenziswa

1. Qalisa uhlelo
2. Nikeza imvume Yokufinyeleleka uma ucelwa (yedatha ebukhoma)
3. Vula uhlelo lwe-Apple Stocks (ngokuzikhethela, ukuthola imiphumela emihle kakhulu)
4. Chofoza u-Vuselela ukuze ulayishe uhlu lwakho lokubuka
5. Khetha izabelo (noma ukhiphe zonke)
6. Chofoza u-Khipha bese ukhetha ifomethi yakho

## Ubumfihlo

Lolu hlelo:

- Lufunda kuphela idatha evela ohlelweni lwe-Apple Stocks
- Aluxhumi ku-inthanethi
- Aluqoqi noma ludlulise noma iyiphi idatha
- Konke ukucubungula kwenzeka endaweni ku-Mac yakho

## Ilayisensi

Ilayisensi ye-MIT — bheka ifayela le-[LICENSE](../../../LICENSE) ukuthola imininingwane.
