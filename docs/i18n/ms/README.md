[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Aplikasi macOS asli untuk mengeksport senarai pantau Apple Stocks anda ke format CSV atau JSON.

Apple tidak menyediakan cara rasmi untuk mengeksport data senarai pantau Stocks anda. Aplikasi ini menyelesaikan masalah tersebut menggunakan dua kaedah yang saling melengkapi:

1. **API Kebolehcapaian (Accessibility API)** — Membaca antara muka Stocks.app yang sedang berjalan secara masa nyata
2. **Cache Widget** — Menghurai fail cache yang disimpan secara setempat apabila aplikasi tidak berjalan

## Ciri-ciri

- **Antara muka SwiftUI asli** dengan sokongan mod gelap dan susun atur RTL
- **Pelbagai sumber data** — API Kebolehcapaian atau penghuraian cache
- **Eksport ke CSV atau JSON** dengan lajur yang boleh disesuaikan
- **Pratonton sebelum eksport** — Lihat dengan tepat apa yang akan dieksport
- **Pemilihan lajur** — Pilih medan data yang ingin disertakan
- **Salin ke papan keratan** — Eksport pantas tanpa menyimpan fail
- **Keutamaan berterusan** — Mengingati tetapan eksport anda
- **Antara muka setempat** — Tersedia dalam 45 bahasa

## Bahasa yang Disokong

Stocks Exporter menggunakan keutamaan bahasa sistem macOS dan menyertakan penyetempatan antara muka penuh untuk 45 bahasa (termasuk sokongan susun atur kanan-ke-kiri automatik untuk bahasa Arab, Parsi, Ibrani dan Urdu). Lihat senarai penuh dalam [README bahasa Inggeris](../../../README.md#supported-languages).

## Keperluan

- macOS 14.0 (Sonoma) atau lebih baharu
- Kebenaran Kebolehcapaian (untuk data langsung daripada Stocks.app)

## Membina Aplikasi

```bash
swift build
swift run
```

Atau buka dalam Xcode dan bina.

## Cara Penggunaan

1. Lancarkan aplikasi
2. Berikan kebenaran Kebolehcapaian apabila diminta (untuk data langsung)
3. Buka aplikasi Apple Stocks (pilihan, untuk hasil terbaik)
4. Klik Segar Semula untuk memuatkan senarai pantau anda
5. Pilih saham (atau eksport semua)
6. Klik Eksport dan pilih format anda

## Privasi

Aplikasi ini:

- Hanya membaca data daripada aplikasi Apple Stocks
- Tidak bersambung ke internet
- Tidak mengumpul atau menghantar sebarang data
- Melakukan semua pemprosesan secara setempat pada Mac anda

## Lesen

Lesen MIT — lihat fail [LICENSE](../../../LICENSE) untuk butiran lanjut.
