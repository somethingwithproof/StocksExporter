[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Nativna macOS aplikacija za izvoz vašeg popisa za praćenje iz aplikacije Apple Stocks u CSV ili JSON format.

Apple ne nudi službeni način za izvoz podataka s popisa za praćenje u aplikaciji Stocks. Ova aplikacija rješava taj problem pomoću dviju komplementarnih metoda:

1. **Accessibility API** - čita sučelje pokrenute aplikacije Stocks.app u stvarnom vremenu
2. **Predmemorija widgeta** - raščlanjuje lokalno pohranjene datoteke predmemorije kada aplikacija nije pokrenuta

## Značajke

- **Nativno SwiftUI sučelje** s podrškom za tamni način rada i RTL raspored
- **Više izvora podataka** - Accessibility API ili raščlanjivanje predmemorije
- **Izvoz u CSV ili JSON** s prilagodljivim stupcima
- **Pretpregled prije izvoza** - pogledajte točno što izvozite
- **Odabir stupaca** - odaberite koja podatkovna polja želite uključiti
- **Kopiranje u međuspremnik** - brzi izvoz bez pohrane datoteke
- **Trajne postavke** - pamti vaše postavke izvoza
- **Lokalizirano sučelje** - dostupno na 48 jezika

## Podržani jezici

Stocks Exporter koristi sustavne jezične postavke macOS-a te uključuje potpunu lokalizaciju korisničkog sučelja za 48 jezika (uključujući automatsku podršku za raspored zdesna nalijevo za arapski, perzijski, hebrejski i urdu). Cjelovit popis jezika potražite u [engleskoj datoteci README](../../../README.md#supported-languages).

## Zahtjevi

- macOS 14.0 (Sonoma) ili noviji
- Dopuštenje pristupačnosti (za podatke uživo iz aplikacije Stocks.app)

## Izgradnja

```bash
swift build
swift run
```

Ili otvorite projekt u aplikaciji Xcode i izgradite ga.

## Upotreba

1. Pokrenite aplikaciju
2. Odobrite dopuštenje pristupačnosti kada se to zatraži (za podatke uživo)
3. Otvorite aplikaciju Apple Stocks (neobavezno, za najbolje rezultate)
4. Kliknite Osvježi za učitavanje popisa za praćenje
5. Odaberite dionice (ili izvezite sve)
6. Kliknite Izvezi i odaberite format

## Privatnost

Ova aplikacija:

- Čita podatke isključivo iz Appleove aplikacije Stocks
- Ne povezuje se s internetom
- Ne prikuplja niti šalje nikakve podatke
- Sva se obrada odvija lokalno na vašem Mac računalu

## Licenca

MIT licenca - pojedinosti potražite u datoteci [LICENSE](../../../LICENSE).
