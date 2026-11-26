[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Aplikasi macOS asli untuk mengekspor daftar pantau Apple Stocks Anda ke format CSV atau JSON.

Apple tidak menyediakan cara resmi untuk mengekspor data daftar pantau Stocks Anda. Aplikasi ini menyelesaikan masalah tersebut dengan dua metode yang saling melengkapi:

1. **API Aksesibilitas** — Membaca antarmuka Stocks.app yang sedang berjalan secara waktu nyata
2. **Cache Widget** — Mengurai file cache yang tersimpan secara lokal saat aplikasi tidak berjalan

## Fitur

- **Antarmuka SwiftUI asli** dengan dukungan mode gelap dan tata letak RTL
- **Beragam sumber data** — API Aksesibilitas atau penguraian cache
- **Ekspor ke CSV atau JSON** dengan kolom yang dapat disesuaikan
- **Pratinjau sebelum ekspor** — Lihat secara tepat apa yang akan Anda ekspor
- **Pemilihan kolom** — Pilih bidang data yang ingin disertakan
- **Salin ke papan klip** — Ekspor cepat tanpa menyimpan file
- **Preferensi persisten** — Mengingat pengaturan ekspor Anda
- **Antarmuka terlokalisasi** — Tersedia dalam 45 bahasa

## Bahasa yang Didukung

Stocks Exporter menggunakan preferensi bahasa sistem macOS dan menyertakan pelokalan antarmuka lengkap untuk 45 bahasa (termasuk dukungan tata letak kanan-ke-kiri otomatis untuk bahasa Arab, Persia, Ibrani, dan Urdu). Lihat daftar lengkapnya di [README bahasa Inggris](../../../README.md#supported-languages).

## Persyaratan

- macOS 14.0 (Sonoma) atau versi lebih baru
- Izin Aksesibilitas (untuk data langsung dari Stocks.app)

## Membangun Aplikasi

```bash
swift build
swift run
```

Atau buka di Xcode lalu bangun.

## Cara Penggunaan

1. Buka aplikasi
2. Berikan izin Aksesibilitas saat diminta (untuk data langsung)
3. Buka aplikasi Apple Stocks (opsional, untuk hasil terbaik)
4. Klik Segarkan untuk memuat daftar pantau Anda
5. Pilih saham (atau ekspor semua)
6. Klik Ekspor lalu pilih format Anda

## Privasi

Aplikasi ini:

- Hanya membaca data dari aplikasi Apple Stocks
- Tidak terhubung ke internet
- Tidak mengumpulkan atau mengirimkan data apa pun
- Melakukan seluruh pemrosesan secara lokal di Mac Anda

## Lisensi

Lisensi MIT — lihat file [LICENSE](../../../LICENSE) untuk detailnya.
