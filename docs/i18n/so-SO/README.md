[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Barnaamij asal ah oo macOS ah oo loogu talagalay in liiskaaga la socodka ee Apple Stocks loogu dhoofiyo qaabka CSV ama JSON.

Apple ma bixiso hab rasmi ah oo lagu dhoofiyo xogta liiskaaga la socodka ee Stocks. Barnaamijkan wuxuu xallinayaa dhibaatadaas isagoo adeegsanaya laba hab oo iskaabaya:

1. **Accessibility API** — Wuxuu si toos ah u akhriyaa wejiga barnaamijka Stocks.app ee shaqaynaya waqtiga dhabta ah
2. **Kaydka KMG ah ee Widget (Widget Cache)** — Wuxuu falanqeeyaa faylasha kaydka KMG ah ee gudaha ku kaydsan marka barnaamijku uusan shaqaynayn

## Astaamaha

- **Weji SwiftUI oo asal ah** oo taageera habka mugdiga iyo qaabeynta RTL
- **Ilo xog oo badan** — Accessibility API ama falanqaynta kaydka KMG ah
- **U dhoofinta CSV ama JSON** oo leh tiirar la habayn karo
- **Horudhac ka hor dhoofinta** — Arag sida saxda ah waxa aad dhoofinayso
- **Xulashada tiirarka** — Dooro goobaha xogta ee la rabo in lagu daro
- **U koobiyeey sabuuradda** — Dhoofin degdeg ah adigoon kaydin fayl
- **Dooqyada joogtada ah** — Wuxuu xasuustaa dejintaada dhoofinta
- **Weji afaf badan leh** — Waxaa lagu heli karaa 45 luqadood

## Luqadaha la Taageero

Stocks Exporter wuxuu adeegsadaa dookha luqadda nidaamka macOS wuxuuna leeyahay turjumaad buuxda oo 45 luqadood ah (oo ay ku jirto taageero toos ah oo midig-ilaa-bidix ah oo loogu talagalay Carabi, Faarsi, Cibraani, iyo Urdu). Ka eeg liiska buuxa [README-ga Ingiriisiga](../../../README.md#supported-languages).

## Shuruudaha

- macOS 14.0 (Sonoma) ama ka cusub
- Ogolaanshaha Helitaanka Fudud (xogta tooska ah ee ka timaada Stocks.app)

## Dhisidda

```bash
swift build
swift run
```

Ama ku fur Xcode oo dhis.

## Isticmaalka

1. Fur barnaamijka
2. Sii ogolaanshaha Helitaanka Fudud marka lagu weydiiyo (xogta tooska ah)
3. Fur barnaamijka Apple Stocks (ikhtiyaari, natiijooyinka ugu fiican)
4. Guji Cusboonaysii si aad u soo rarto liiskaaga la socodka
5. Dooro saamiyo (ama dhoofi dhammaan)
6. Guji Dhoofi oo dooro qaabkaaga

## Qarsoodiga

Barnaamijkan:

- Wuxuu xogta ka akhriyaa oo keliya barnaamijka Apple Stocks
- Kuma xirmo internetka
- Ma ururiyo mana diro wax xog ah
- Dhammaan habayntu waxay si maxalli ah uga dhacdaa Mac-gaaga

## Shatiga

Shatiga MIT — ka eeg faylka [LICENSE](../../../LICENSE) faahfaahin dheeraad ah.
