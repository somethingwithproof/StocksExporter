[English](../../../README.md)

<div dir="rtl">

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

יישום מקומי ל-macOS לייצוא רשימת המעקב שלך מ-Apple Stocks לפורמט CSV או JSON.

Apple אינה מספקת דרך רשמית לייצא את נתוני רשימת המעקב שלך מ-Stocks. יישום זה פותר בעיה זו באמצעות שתי שיטות משלימות:

1. **ממשק נגישות (Accessibility API)** — קורא בזמן אמת את הממשק של Stocks.app הפועל
2. **מטמון הווידג'ט (Widget Cache)** — מפענח קובצי מטמון השמורים מקומית כאשר היישום אינו פועל

## תכונות

- **ממשק SwiftUI מקומי** עם תמיכה במצב כהה ובפריסת RTL
- **מספר מקורות נתונים** — ממשק נגישות או פענוח מטמון
- **ייצוא ל-CSV או ל-JSON** עם עמודות הניתנות להתאמה אישית
- **תצוגה מקדימה לפני הייצוא** — צפה בדיוק במה שאתה מייצא
- **בחירת עמודות** — בחר אילו שדות נתונים לכלול
- **העתקה ללוח** — ייצוא מהיר ללא שמירת קובץ
- **העדפות נשמרות** — זוכר את הגדרות הייצוא שלך
- **ממשק מותאם לשפות** — זמין ב-45 שפות

## שפות נתמכות

Stocks Exporter משתמש בהעדפות שפת המערכת של macOS וכולל תרגום ממשק מלא ל-45 שפות (כולל תמיכה אוטומטית בכיוון מימין לשמאל לערבית, פרסית, עברית ואורדו). לרשימה המלאה ראו את [קובץ ה-README באנגלית](../../../README.md#supported-languages).

## דרישות מערכת

- macOS 14.0 (Sonoma) ומעלה
- הרשאת נגישות (עבור נתונים בזמן אמת מ-Stocks.app)

## בנייה והרצה

</div>

```bash
swift build
swift run
```

<div dir="rtl">

או פתח את הפרויקט ב-Xcode ובנה אותו.

## שימוש

1. הפעל את היישום
2. הענק הרשאת נגישות כאשר תתבקש (עבור נתונים בזמן אמת)
3. פתח את יישום Apple Stocks (אופציונלי, לתוצאות מיטביות)
4. לחץ על רענון כדי לטעון את רשימת המעקב שלך
5. בחר מניות (או ייצא הכול)
6. לחץ על ייצוא ובחר את הפורמט הרצוי

## פרטיות

יישום זה:

- קורא נתונים מיישום Apple Stocks בלבד
- אינו מתחבר לאינטרנט
- אינו אוסף או משדר נתונים כלשהם
- מבצע את כל העיבוד באופן מקומי על ה-Mac שלך

## רישיון

רישיון MIT — ראו את הקובץ [LICENSE](../../../LICENSE) לפרטים מלאים.

</div>
