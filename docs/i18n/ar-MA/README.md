[English](../../../README.md)

<div dir="rtl">

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

تطبيق macOS أصيل لتصدير لائحة التتبع الخاصة بك في Apple Stocks إلى صيغة CSV أو JSON.

لا توفّر Apple وسيلة رسمية لتصدير معطيات لائحة التتبع في تطبيق Stocks. يعالج هذا التطبيق هذه الإشكالية عبر طريقتين متكاملتين:

1. **واجهة إمكانية الولوج (Accessibility API)** — تقرأ واجهة تطبيق Stocks.app المشغّل بشكل فوري
2. **الذاكرة المخبأة للودجت (Widget Cache)** — تحلّل ملفات الذاكرة المخبأة المحفوظة محلياً عند عدم تشغيل التطبيق

## المميزات

- **واجهة SwiftUI أصيلة** مع دعم الوضع الداكن واتجاه العرض من اليمين إلى اليسار (RTL)
- **مصادر معطيات متعددة** — واجهة إمكانية الولوج أو تحليل الذاكرة المخبأة
- **التصدير إلى CSV أو JSON** مع أعمدة قابلة للتخصيص
- **معاينة قبل التصدير** — تحقّق بدقة مما ستقوم بتصديره
- **اختيار الأعمدة** — حدّد حقول المعطيات التي ترغب في تضمينها
- **النسخ إلى الحافظة** — تصدير سريع دون الحاجة إلى حفظ ملف
- **تفضيلات محفوظة** — يحتفظ التطبيق بإعدادات التصدير الخاصة بك
- **واجهة مترجمة** — متوفرة بـ 45 لغة

## اللغات المدعومة

يعتمد Stocks Exporter على تفضيلات لغة النظام في macOS ويشمل توطيناً كاملاً لـ 45 لغة (مع دعم تلقائي للعرض من اليمين إلى اليسار للعربية والفارسية والعبرية والأردية). للاطلاع على اللائحة الكاملة، المرجو زيارة [ملف README بالإنجليزية](../../../README.md#supported-languages).

## المتطلبات

- نظام macOS 14.0 (Sonoma) أو أحدث
- صلاحية إمكانية الولوج (لجلب المعطيات الفورية من Stocks.app)

## البناء والتشغيل

</div>

```bash
swift build
swift run
```

<div dir="rtl">

أو افتح المشروع في Xcode وقم ببنائه.

## الاستعمال

1. افتح التطبيق
2. امنح صلاحية إمكانية الولوج عند الطلب (للمعطيات الفورية)
3. افتح تطبيق Apple Stocks (اختياري، للحصول على أفضل النتائج)
4. انقر على «تحيين» لتحميل لائحة التتبع الخاصة بك
5. اختر الأسهم (أو قم بتصدير الكل)
6. انقر على «تصدير» واختر الصيغة المطلوبة

## الخصوصية

هذا التطبيق:

- يقرأ المعطيات حصرياً من تطبيق Apple Stocks
- لا يتصل بالإنترنت
- لا يجمع ولا يرسل أي معطيات
- تتم جميع عمليات المعالجة محلياً على حاسوب Mac الخاص بك

## الترخيص

رخصة MIT — المرجو الاطلاع على ملف [LICENSE](../../../LICENSE) للمزيد من التفاصيل.

</div>
