[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Apple Stocks のウォッチリストを CSV または JSON 形式で書き出すネイティブ macOS アプリです。

Apple は Stocks のウォッチリストデータを書き出す公式な手段を提供していません。このアプリは次の 2 つの補完的な方法で解決します。

1. **アクセシビリティ API** — 起動中の Stocks.app の画面からリアルタイムに読み取ります
2. **ウィジェットキャッシュ** — アプリが起動していないときにローカル保存されたキャッシュファイルを解析します

## 主な機能

- **ネイティブ SwiftUI インターフェース** — ダークモードおよび RTL レイアウト対応
- **複数のデータソース** — アクセシビリティ API またはキャッシュ解析
- **CSV / JSON 書き出し** — 出力する列を自由にカスタマイズ可能
- **書き出し前プレビュー** — 出力内容を事前に確認できます
- **列の選択** — 含めるデータ項目を選択可能
- **クリップボードにコピー** — ファイルを保存せずに素早く書き出し
- **設定の永続化** — 書き出し設定を記憶します
- **多言語インターフェース** — 45 言語に対応

## 対応言語

Stocks Exporter は macOS のシステム言語設定を使用し、45 言語の完全な UI ローカライズに対応しています（アラビア語・ペルシャ語・ヘブライ語・ウルドゥー語の自動 RTL レイアウト対応を含む）。対応言語の一覧は[英語の README](../../../README.md#supported-languages)をご覧ください。

## 動作要件

- macOS 14.0 (Sonoma) 以降
- アクセシビリティ権限（Stocks.app からのリアルタイム取得用）

## ビルド方法

```bash
swift build
swift run
```

または Xcode で開いてビルドしてください。

## 使い方

1. アプリを起動します
2. 求められたらアクセシビリティ権限を許可します（リアルタイム取得用）
3. Apple Stocks アプリを開きます（任意、最適な結果を得るため）
4. 「更新」をクリックしてウォッチリストを読み込みます
5. 銘柄を選択します（またはすべて書き出します）
6. 「書き出す」をクリックして形式を選びます

## プライバシー

このアプリは：

- Apple Stocks アプリのデータのみを読み取ります
- インターネットに接続しません
- データの収集や送信を行いません
- すべての処理を Mac 上でローカルに実行します

## ライセンス

MIT ライセンス — 詳細は [LICENSE](../../../LICENSE) ファイルをご覧ください。
