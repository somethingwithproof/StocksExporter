[English](../../../README.md)

<div dir="rtl">

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

تطبيق أصيل لنظام macOS لتصدير قائمة المتابعة الخاصة بك من Apple Stocks بصيغة CSV أو JSON.

لا توفّر Apple طريقة رسمية لتصدير بيانات قائمة المتابعة في تطبيق Stocks. يحلّ هذا التطبيق هذه المشكلة باستخدام طريقتين متكاملتين:

1. **واجهة برمجة تسهيلات الاستخدام (Accessibility API)** — تقرأ واجهة تطبيق Stocks.app أثناء تشغيله في الوقت الفعلي
2. **ذاكرة الأداة المؤقتة (Widget Cache)** — تحلّل ملفات الذاكرة المؤقتة المخزّنة محلياً عندما لا يكون التطبيق قيد التشغيل

## المزايا

- **واجهة SwiftUI أصيلة** مع دعم الوضع الداكن واتجاه العرض من اليمين إلى اليسار (RTL)
- **مصادر بيانات متعددة** — واجهة تسهيلات الاستخدام أو تحليل الذاكرة المؤقتة
- **التصدير إلى CSV أو JSON** مع أعمدة قابلة للتخصيص
- **معاينة قبل التصدير** — شاهد بدقة ما ستقوم بتصديره
- **اختيار الأعمدة** — حدّد حقول البيانات التي تريد تضمينها
- **النسخ إلى الحافظة** — تصدير سريع دون حفظ ملف
- **تفضيلات دائمة** — حفظ إعدادات التصدير الخاصة بك
- **واجهة معرّبة ومتعددة اللغات** — متوفرة بـ 45 لغة

## اللغات المدعومة

يستخدم Stocks Exporter تفضيلات لغة النظام في macOS ويتضمن تعريباً وتوطيناً كاملاً لـ 45 لغة (بما في ذلك الدعم التلقائي لتخطيط من اليمين إلى اليسار للعربية والفارسية والعبرية والأردية). راجع الجدول الكامل في [ملف README بالإنجليزية](../../../README.md#supported-languages).

## المتطلبات

- نظام macOS 14.0 (Sonoma) أو أحدث
- إذن تسهيلات الاستخدام (للحصول على البيانات الفورية من Stocks.app)

## البناء والتشغيل

</div>

```bash
swift build
swift run
```

<div dir="rtl">

أو افتح المشروع في Xcode وقم ببنائه.

## الاستخدام

1. شغّل التطبيق
2. امنح إذن تسهيلات الاستخدام عند الطلب (للبيانات الفورية)
3. افتح تطبيق Apple Stocks (اختياري، للحصول على أفضل النتائج)
4. انقر على «تحديث» لتحميل قائمة المتابعة الخاصة بك
5. حدّد الأسهم (أو صدّر الجميع)
6. انقر على «تصدير» واختر الصيغة المناسبة

## الخصوصية

يقوم هذا التطبيق بما يلي:

- يقرأ البيانات فقط من تطبيق Apple Stocks
- لا يتصل بالإنترنت
- لا يجمع أو يرسل أي بيانات
- تتم جميع عمليات المعالجة محلياً على جهاز Mac الخاص بك

## الترخيص

رخصة MIT — راجع ملف [LICENSE](../../../LICENSE) للتفاصيل.

</div>
