[English](../../../README.md)

<div dir="rtl">

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

تطبيق macOS أصلي عشان تصدّر قايمة المتابعة بتاعتك من Apple Stocks بصيغة CSV أو JSON.

شركة Apple مش بتوفّر طريقة رسمية لتصدير بيانات قايمة المتابعة في تطبيق Stocks. التطبيق ده بيحل المشكلة دي بطريقتين بيكمّلوا بعض:

1. **واجهة إمكانية الوصول (Accessibility API)** — بتقرأ واجهة تطبيق Stocks.app وهو شغّال لحظة بلحظة
2. **كاش الويدجت (Widget Cache)** — بتقرأ ملفات الكاش المحفوظة على جهازك لما التطبيق ما يكونش مفتوح

## المميزات

- **واجهة SwiftUI أصلية** بتدعم الوضع الداكن واتجاه العرض من اليمين للشمال (RTL)
- **مصادر بيانات متعددة** — إمكانية الوصول أو قراءة الكاش
- **تصدير لملفات CSV أو JSON** مع أعمدة تقدر تختارها بنفسك
- **معاينة قبل التصدير** — شوف بالظبط إيه اللي هيتصدّر
- **اختيار الأعمدة** — حدّد الحقول اللي عايز تضمّنها
- **النسخ للحافظة** — تصدير سريع من غير ما تحفظ ملف
- **حفظ الإعدادات** — بيفتكر إعدادات التصدير بتاعتك تلقائياً
- **واجهة مترجمة** — متاحة بـ 45 لغة

## اللغات المدعومة

بيستخدم Stocks Exporter إعدادات لغة النظام في macOS وبيوفّر ترجمة كاملة لـ 45 لغة (بما فيها الدعم التلقائي لاتجاه اليمين للشمال للعربي والفارسي والعبري والأردو). تقدر تشوف الجدول الكامل في [ملف README بالإنجليزية](../../../README.md#supported-languages).

## المتطلبات

- نظام macOS 14.0 (Sonoma) أو أحدث
- إذن إمكانية الوصول (عشان البيانات المباشرة من Stocks.app)

## البناء والتشغيل

</div>

```bash
swift build
swift run
```

<div dir="rtl">

أو افتح المشروع في Xcode وابنيه من هناك.

## طريقة الاستخدام

1. افتح التطبيق
2. اسمح بإذن إمكانية الوصول لما يطلب منك (عشان البيانات المباشرة)
3. افتح تطبيق Apple Stocks (اختياري، لأفضل نتيجة)
4. اضغط على «تحديث» عشان تحمّل قايمة المتابعة بتاعتك
5. اختار الأسهم (أو صدّر الكل)
6. اضغط على «تصدير» واختار الصيغة اللي تناسبك

## الخصوصية

التطبيق ده:

- بيقرأ بس البيانات من تطبيق Apple Stocks
- مش بيتصل بالإنترنت خالص
- مش بيجمع ولا بيبعت أي بيانات
- كل الشغل بيتم محلياً على جهاز الـ Mac بتاعك

## الترخيص

رخصة MIT — راجع ملف [LICENSE](../../../LICENSE) للتفاصيل.

</div>
