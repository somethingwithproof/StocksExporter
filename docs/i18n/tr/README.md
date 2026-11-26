[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Apple Stocks izleme listenizi CSV veya JSON biçiminde dışa aktarmak için yerel bir macOS uygulaması.

Apple, Stocks izleme listesi verilerinizi dışa aktarmak için resmi bir yol sunmaz. Bu uygulama, birbirini tamamlayan iki yöntem kullanarak bu sorunu çözer:

1. **Erişilebilirlik API'si** — Çalışan Stocks.app arayüzünü gerçek zamanlı olarak okur
2. **Araç Takımı Önbelleği** — Uygulama çalışmıyorken yerel olarak depolanan önbellek dosyalarını ayrıştırır

## Özellikler

- **Yerel SwiftUI arayüzü** — koyu mod ve sağdan sola (RTL) düzen desteğiyle
- **Birden fazla veri kaynağı** — Erişilebilirlik API'si veya önbellek ayrıştırma
- **CSV veya JSON olarak dışa aktarma** — özelleştirilebilir sütunlarla
- **Dışa aktarmadan önce önizleme** — tam olarak neyi dışa aktardığınızı görün
- **Sütun seçimi** — hangi veri alanlarının dahil edileceğini seçin
- **Panoya kopyalama** — dosya kaydetmeden hızlı dışa aktarma
- **Kalıcı tercihler** — dışa aktarma ayarlarınızı hatırlar
- **Yerelleştirilmiş arayüz** — 45 dilde kullanılabilir

## Desteklenen Diller

Stocks Exporter, macOS sistem dili tercihlerini kullanır ve 45 dil için tam arayüz yerelleştirmesi içerir (Arapça, Farsça, İbranice ve Urduca için otomatik sağdan sola düzen desteği dahil). Tam liste için [İngilizce README](../../../README.md#supported-languages) dosyasına bakın.

## Gereksinimler

- macOS 14.0 (Sonoma) veya üzeri
- Erişilebilirlik izni (Stocks.app'ten canlı veriler için)

## Derleme

```bash
swift build
swift run
```

Veya Xcode içinde açıp derleyin.

## Kullanım

1. Uygulamayı başlatın
2. İstendiğinde Erişilebilirlik iznini verin (canlı veriler için)
3. Apple Stocks uygulamasını açın (isteğe bağlı, en iyi sonuçlar için)
4. İzleme listenizi yüklemek için Yenile'ye tıklayın
5. Hisse senetlerini seçin (veya tümünü dışa aktarın)
6. Dışa Aktar'a tıklayın ve biçiminizi seçin

## Gizlilik

Bu uygulama:

- Yalnızca Apple'ın Stocks uygulamasından veri okur
- İnternete bağlanmaz
- Hiçbir veri toplamaz veya iletmez
- Tüm işlemleri Mac'inizde yerel olarak gerçekleştirir

## Lisans

MIT Lisansı — ayrıntılar için [LICENSE](../../../LICENSE) dosyasına bakın.
