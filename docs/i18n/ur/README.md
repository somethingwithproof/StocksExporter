[English](../../../README.md)

<div dir="rtl">

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

آپ کی Apple Stocks واچ لسٹ کو CSV یا JSON فارمیٹ میں برآمد کرنے کے لیے ایک مقامی macOS ایپ۔

Apple آپ کی Stocks واچ لسٹ کا ڈیٹا برآمد کرنے کا کوئی سرکاری طریقہ فراہم نہیں کرتا۔ یہ ایپ دو تکمیلی طریقوں سے اس مسئلے کو حل کرتی ہے:

1. **رسائی کی سہولت API (Accessibility API)** — چلتی ہوئی Stocks.app کا انٹرفیس حقیقی وقت میں پڑھتی ہے
2. **ویجیٹ کیشے (Widget Cache)** — جب ایپ نہ چل رہی ہو تو مقامی طور پر محفوظ کردہ کیشے فائلوں کا تجزیہ کرتی ہے

## خصوصیات

- **مقامی SwiftUI انٹرفیس** ڈارک موڈ اور دائیں سے بائیں (RTL) لے آؤٹ سپورٹ کے ساتھ
- **متعدد ڈیٹا ذرائع** — Accessibility API یا کیشے تجزیہ
- **CSV یا JSON میں برآمد** حسبِ ضرورت کالمز کے ساتھ
- **برآمد سے پہلے پیش منظر** — بالکل وہی دیکھیں جو آپ برآمد کر رہے ہیں
- **کالم کا انتخاب** — منتخب کریں کہ کون سے ڈیٹا فیلڈز شامل کرنے ہیں
- **کلپ بورڈ پر کاپی کریں** — فائل محفوظ کیے بغیر فوری برآمد
- **مستقل ترجیحات** — آپ کی برآمد سیٹنگز کو یاد رکھتی ہے
- **مقامی زبانوں میں انٹرفیس** — 45 زبانوں میں دستیاب

## معاون زبانیں

Stocks Exporter macOS سسٹم کی زبان کی ترجیحات استعمال کرتی ہے اور 45 زبانوں کے لیے مکمل UI لوکلائزیشن شامل کرتی ہے (بشمول عربی، فارسی، عبرانی اور اردو کے لیے خودکار دائیں سے بائیں لے آؤٹ سپورٹ)۔ مکمل فہرست کے لیے [انگریزی README](../../../README.md#supported-languages) دیکھیں۔

## تقاضے

- macOS 14.0 (Sonoma) یا اس کے بعد کا ورژن
- رسائی کی سہولت کی اجازت (Stocks.app سے لائیو ڈیٹا کے لیے)

## بلڈ اور رن

</div>

```bash
swift build
swift run
```

<div dir="rtl">

یا Xcode میں کھول کر بلڈ کریں۔

## استعمال کا طریقہ

1. ایپ لانچ کریں
2. پوچھے جانے پر رسائی کی سہولت کی اجازت دیں (لائیو ڈیٹا کے لیے)
3. Apple Stocks ایپ کھولیں (اختیاری، بہترین نتائج کے لیے)
4. اپنی واچ لسٹ لوڈ کرنے کے لیے تازہ کریں پر کلک کریں
5. حصص منتخب کریں (یا سب برآمد کریں)
6. برآمد کریں پر کلک کریں اور اپنا فارمیٹ منتخب کریں

## رازداری

یہ ایپ:

- صرف Apple کی Stocks ایپ سے ڈیٹا پڑھتی ہے
- انٹرنیٹ سے منسلک نہیں ہوتی
- کوئی ڈیٹا اکٹھا یا منتقل نہیں کرتی
- تمام کارروائی آپ کے Mac پر مقامی طور پر انجام دیتی ہے

## لائسنس

MIT لائسنس — تفصیلات کے لیے [LICENSE](../../../LICENSE) فائل دیکھیں۔

</div>
