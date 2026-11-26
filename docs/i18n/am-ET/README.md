[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

የApple Stocks የክትትል ዝርዝርዎን ወደ CSV ወይም JSON ቅርጸት ለመላክ የተሰራ የmacOS ተወላጅ መተግበሪያ።

Apple የStocks የክትትል ዝርዝር ውሂብዎን ለመላክ ይፋዊ መንገድ አያቀርብም። ይህ መተግበሪያ ሁለት ተደጋጋፊ ዘዴዎችን በመጠቀም ችግሩን ይፈታል፦

1. **የተደራሽነት API (Accessibility API)** — እየሰራ ያለውን የStocks.app በይነገጽ በቅጽበት ያነባል
2. **የመግብር መሸጎጫ (Widget Cache)** — መተግበሪያው በማይሰራበት ጊዜ በመሣሪያው ላይ የተቀመጡ የመሸጎጫ ፋይሎችን ይተነትናል

## ባህሪያት

- **ተወላጅ የSwiftUI በይነገጽ** ከጨለማ ሁነታ እና ከRTL አቀማመጥ ድጋፍ ጋር
- **ብዙ የውሂብ ምንጮች** — የተደራሽነት API ወይም የመሸጎጫ ትንተና
- **ወደ CSV ወይም JSON መላክ** ከሚስተካከሉ ዓምዶች ጋር
- **ከመላክ በፊት ቅድመ ዕይታ** — ምን እንደሚልኩ በትክክል ይመልከቱ
- **የዓምድ ምርጫ** — የትኞቹን የውሂብ መስኮች እንደሚያካትቱ ይምረጡ
- **ወደ ቅንጥብ ሰሌዳ መቅዳት** — ፋይል ሳያስቀምጡ ፈጣን መላክ
- **ቋሚ ምርጫዎች** — የመላኪያ ቅንብሮችዎን ያስታውሳል
- **የተተረጎመ በይነገጽ** — በ45 ቋንቋዎች ይገኛል

## የሚደገፉ ቋንቋዎች

Stocks Exporter የmacOS የስርዓት ቋንቋ ምርጫዎችን ይጠቀማል እና ለ45 ቋንቋዎች ሙሉ የበይነገጽ ትርጉም ያካትታል (ለአረብኛ፣ ፋርስኛ፣ ዕብራይስጥ እና ኡርዱ ራስ-ሰር ከቀኝ ወደ ግራ አቀማመጥ ድጋፍ ጨምሮ)። ሙሉውን ዝርዝር በ[እንግሊዝኛው README](../../../README.md#supported-languages) ውስጥ ይመልከቱ።

## መስፈርቶች

- macOS 14.0 (Sonoma) ወይም ከዚያ በላይ
- የተደራሽነት ፈቃድ (ከStocks.app የቀጥታ ውሂብ ለማግኘት)

## ግንባታ

```bash
swift build
swift run
```

ወይም በXcode ውስጥ ከፍተው ይገንቡት።

## አጠቃቀም

1. መተግበሪያውን ያስጀምሩ
2. ሲጠየቁ የተደራሽነት ፈቃድ ይስጡ (ለቀጥታ ውሂብ)
3. የApple Stocks መተግበሪያን ይክፈቱ (አማራጭ፣ ለተሻለ ውጤት)
4. የክትትል ዝርዝርዎን ለመጫን «አድስ» የሚለውን ጠቅ ያድርጉ
5. አክሲዮኖችን ይምረጡ (ወይም ሁሉንም ይላኩ)
6. «ላክ» የሚለውን ጠቅ ያድርጉ እና ቅርጸትዎን ይምረጡ

## ግላዊነት

ይህ መተግበሪያ፦

- ውሂብ የሚያነበው ከApple Stocks መተግበሪያ ብቻ ነው
- ከበይነመረብ ጋር አይገናኝም
- ምንም ውሂብ አይሰበስብም ወይም አያስተላልፍም
- ሁሉም ሂደቶች በMacዎ ላይ በአካባቢው ይከናወናሉ

## ፈቃድ

የMIT ፈቃድ — ለዝርዝሮች የ[LICENSE](../../../LICENSE) ፋይልን ይመልከቱ።
