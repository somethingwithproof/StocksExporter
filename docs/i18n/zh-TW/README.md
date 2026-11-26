[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

一款原生 macOS 應用程式，可將您的 Apple Stocks 觀察清單匯出為 CSV 或 JSON 格式。

Apple 未提供官方方式匯出 Stocks 觀察清單資料。本應用程式透過兩種互補方式解決此問題：

1. **輔助使用 API** — 即時讀取正在執行的 Stocks.app 介面
2. **小工具快取** — 當應用程式未執行時剖析本機儲存的快取檔案

## 功能特色

- **原生 SwiftUI 介面**，支援深色模式與 RTL 版面配置
- **多種資料來源** — 輔助使用 API 或快取剖析
- **匯出為 CSV 或 JSON**，支援自訂欄位
- **匯出前預覽** — 清楚檢視即將匯出的內容
- **欄位選取** — 自由選擇要包含的資料欄位
- **拷貝到剪貼簿** — 不必儲存檔案即可快速匯出
- **持續性偏好設定** — 記住您的匯出設定
- **在地化介面** — 支援 45 種語言

## 支援語言

Stocks Exporter 會依據 macOS 系統語言偏好設定運作，並內建 45 種語言的完整介面在地化（包含阿拉伯文、波斯文、希伯來文與烏爾都文的自動由右至左版面配置支援）。完整語言列表請參閱[英文 README](../../../README.md#supported-languages)。

## 系統需求

- macOS 14.0 (Sonoma) 或以上版本
- 輔助使用權限（用於從 Stocks.app 讀取即時資料）

## 建置方式

```bash
swift build
swift run
```

或在 Xcode 中開啟並建置。

## 使用方式

1. 啟動應用程式
2. 在系統提示時授予輔助使用權限（用於讀取即時資料）
3. 開啟 Apple Stocks 應用程式（選用，可獲得最佳效果）
4. 按一下「重新整理」載入您的觀察清單
5. 選取股票（或匯出全部）
6. 按一下「匯出」並選擇格式

## 隱私權

本應用程式：

- 僅讀取 Apple Stocks 應用程式中的資料
- 不連線至網際網路
- 不收集或傳輸任何資料
- 所有處理皆在您的 Mac 上本機完成

## 授權條款

MIT 授權條款 — 詳情請參閱 [LICENSE](../../../LICENSE) 檔案。
