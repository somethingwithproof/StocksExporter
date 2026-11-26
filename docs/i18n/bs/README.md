[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Nativna macOS aplikacija za izvoz vaše Apple Stocks liste praćenja u CSV ili JSON format.

Apple ne nudi zvaničan način za izvoz podataka s liste praćenja iz aplikacije Stocks. Ova aplikacija rješava taj problem pomoću dvije dopunjujuće metode:

1. **Accessibility API** - čita interfejs pokrenute aplikacije Stocks.app u stvarnom vremenu
2. **Keš vidžeta** - obrađuje lokalno pohranjene keš datoteke kada aplikacija nije pokrenuta

## Mogućnosti

- **Nativni SwiftUI interfejs** s podrškom za tamni način rada i RTL raspored
- **Više izvora podataka** - Accessibility API ili obrada keša
- **Izvoz u CSV ili JSON** s prilagodljivim kolonama
- **Pregled prije izvoza** - pogledajte tačno šta izvozite
- **Odabir kolona** - izaberite koja polja podataka želite uključiti
- **Kopiranje u međuspremnik** - brzi izvoz bez čuvanja datoteke
- **Trajne postavke** - pamti vaše postavke izvoza
- **Lokalizovani interfejs** - dostupan na 48 jezika

## Podržani jezici

Stocks Exporter koristi sistemske jezičke postavke macOS-a i uključuje potpunu lokalizaciju korisničkog interfejsa na 48 jezika (uključujući automatsku podršku za raspored zdesna nalijevo za arapski, perzijski, hebrejski i urdu). Potpunu listu jezika pogledajte u [engleskom README fajlu](../../../README.md#supported-languages).

## Zahtjevi

- macOS 14.0 (Sonoma) ili noviji
- Dozvola pristupačnosti (za podatke uživo iz aplikacije Stocks.app)

## Izgradnja

```bash
swift build
swift run
```

Ili otvorite projekat u Xcodeu i izgradite ga.

## Korištenje

1. Pokrenite aplikaciju
2. Odobrite dozvolu pristupačnosti kada se to zatraži (za podatke uživo)
3. Otvorite aplikaciju Apple Stocks (opcionalno, za najbolje rezultate)
4. Kliknite na Osvježi da učitate listu praćenja
5. Odaberite dionice (ili izvezite sve)
6. Kliknite na Izvezi i odaberite format

## Privatnost

Ova aplikacija:

- Čita podatke isključivo iz Appleove aplikacije Stocks
- Ne povezuje se na internet
- Ne prikuplja niti šalje bilo kakve podatke
- Sva obrada se odvija lokalno na vašem Mac računaru

## Licenca

MIT licenca - za detalje pogledajte datoteku [LICENSE](../../../LICENSE).
