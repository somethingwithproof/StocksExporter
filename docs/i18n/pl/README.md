[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Natywna aplikacja dla systemu macOS służąca do eksportu listy obserwowanych z Apple Stocks do formatu CSV lub JSON.

Apple nie udostępnia oficjalnego sposobu eksportu danych z listy obserwowanych w aplikacji Stocks. Ta aplikacja rozwiązuje ten problem za pomocą dwóch uzupełniających się metod:

1. **API Dostępności** — odczytuje w czasie rzeczywistym interfejs uruchomionej aplikacji Stocks.app
2. **Pamięć podręczna widżetu** — przetwarza lokalnie zapisane pliki pamięci podręcznej, gdy aplikacja nie jest uruchomiona

## Funkcje

- **Natywny interfejs SwiftUI** z obsługą trybu ciemnego i układu RTL
- **Wiele źródeł danych** — API Dostępności lub analiza pamięci podręcznej
- **Eksport do CSV lub JSON** z możliwością wyboru kolumn
- **Podgląd przed eksportem** — sprawdź dokładnie, co eksportujesz
- **Wybór kolumn** — wybierz pola danych, które chcesz uwzględnić
- **Kopiowanie do schowka** — szybki eksport bez zapisywania pliku
- **Trwałe preferencje** — zapamiętuje Twoje ustawienia eksportu
- **Zlokalizowany interfejs** — dostępny w 45 językach

## Obsługiwane języki

Stocks Exporter korzysta z systemowych ustawień języka macOS i zawiera pełną lokalizację interfejsu w 45 językach (w tym automatyczną obsługę układu od prawej do lewej dla języka arabskiego, perskiego, hebrajskiego i urdu). Pełna lista języków znajduje się w [angielskim pliku README](../../../README.md#supported-languages).

## Wymagania

- macOS 14.0 (Sonoma) lub nowszy
- Uprawnienie Dostępności (dla danych na żywo z aplikacji Stocks.app)

## Budowanie

```bash
swift build
swift run
```

Możesz też otworzyć projekt w Xcode i zbudować go bezpośrednio.

## Użycie

1. Uruchom aplikację
2. Przyznaj uprawnienie Dostępności po pojawieniu się monitu (dla danych na żywo)
3. Otwórz aplikację Apple Stocks (opcjonalnie, dla najlepszych wyników)
4. Kliknij Odśwież, aby wczytać listę obserwowanych
5. Zaznacz akcje (lub wyeksportuj wszystkie)
6. Kliknij Eksportuj i wybierz format

## Prywatność

Ta aplikacja:

- Odczytuje dane wyłącznie z aplikacji Apple Stocks
- Nie łączy się z internetem
- Nie gromadzi ani nie przesyła żadnych danych
- Przetwarza wszystko lokalnie na Twoim komputerze Mac

## Licencja

Licencja MIT — szczegóły w pliku [LICENSE](../../../LICENSE).
