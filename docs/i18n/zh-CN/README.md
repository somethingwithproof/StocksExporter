[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

一款原生 macOS 应用，用于将您的 Apple Stocks 自选股导出为 CSV 或 JSON 格式。

Apple 并未提供导出 Stocks 自选股数据的官方方法。本应用通过两种互补方式解决该问题：

1. **辅助功能 API** — 实时读取正在运行的 Stocks.app 界面
2. **小组件缓存** — 当应用未运行时解析本地存储的缓存文件

## 功能特性

- **原生 SwiftUI 界面**，支持深色模式与 RTL 布局
- **多种数据源** — 辅助功能 API 或缓存解析
- **导出为 CSV 或 JSON**，支持自定义列
- **导出前预览** — 精确查看即将导出的内容
- **列选择** — 自由选择要包含的数据字段
- **复制到剪贴板** — 无需保存文件即可快速导出
- **持久化偏好设置** — 记住您的导出设置
- **多语言界面** — 支持 45 种语言

## 支持的语言

Stocks Exporter 遵循 macOS 系统语言设置，内置 45 种语言的完整界面本地化（包括对阿拉伯语、波斯语、希伯来语和乌尔都语的自动从右到左布局支持）。完整语言列表请参阅[英文 README](../../../README.md#supported-languages)。

## 系统要求

- macOS 14.0 (Sonoma) 或更高版本
- 辅助功能权限（用于从 Stocks.app 获取实时数据）

## 构建与运行

```bash
swift build
swift run
```

或在 Xcode 中打开并构建。

## 使用方法

1. 启动应用
2. 根据提示授予辅助功能权限（用于获取实时数据）
3. 打开 Apple Stocks 应用（可选，可获得最佳效果）
4. 点击“刷新”以加载您的自选股
5. 选择股票（或导出全部）
6. 点击“导出”并选择目标格式

## 隐私说明

本应用：

- 仅读取 Apple Stocks 应用中的数据
- 不连接互联网
- 不收集或传输任何数据
- 所有处理均在您的 Mac 本地完成

## 许可证

MIT 许可证 — 详情请参阅 [LICENSE](../../../LICENSE) 文件。
