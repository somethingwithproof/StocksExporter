[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Apple Stocks 관심 종목을 CSV 또는 JSON 형식으로 내보내는 네이티브 macOS 앱입니다.

Apple은 Stocks 관심 종목 데이터를 내보내는 공식 방법을 제공하지 않습니다. 이 앱은 두 가지 상호 보완적인 방식으로 이 문제를 해결합니다.

1. **손쉬운 사용 API** — 실행 중인 Stocks.app 인터페이스를 실시간으로 읽어옵니다
2. **위젯 캐시** — 앱이 실행 중이 아닐 때 로컬에 저장된 캐시 파일을 파싱합니다

## 주요 기능

- **네이티브 SwiftUI 인터페이스** — 다크 모드 및 RTL 레이아웃 지원
- **다양한 데이터 소스** — 손쉬운 사용 API 또는 캐시 파싱
- **CSV 또는 JSON 내보내기** — 사용자 지정 열 지원
- **내보내기 전 미리보기** — 내보낼 내용을 미리 확인
- **열 선택** — 포함할 데이터 필드를 선택
- **클립보드에 복사** — 파일 저장 없이 빠르게 내보내기
- **설정 유지** — 내보내기 설정을 기억합니다
- **다국어 인터페이스** — 45개 언어 지원

## 지원 언어

Stocks Exporter는 macOS 시스템 언어 설정을 사용하며 45개 언어의 전체 UI 현지화를 포함합니다(아랍어, 페르시아어, 히브리어, 우르두어의 자동 RTL 레이아웃 지원 포함). 전체 언어 목록은 [영문 README](../../../README.md#supported-languages)에서 확인하세요.

## 요구 사항

- macOS 14.0 (Sonoma) 이상
- 손쉬운 사용 권한 (Stocks.app 실시간 데이터용)

## 빌드 방법

```bash
swift build
swift run
```

또는 Xcode에서 열어 빌드하세요.

## 사용 방법

1. 앱을 실행합니다
2. 요청 시 손쉬운 사용 권한을 허용합니다 (실시간 데이터용)
3. Apple Stocks 앱을 엽니다 (선택 사항, 최상의 결과를 위해 권장)
4. 새로고침을 클릭하여 관심 종목을 불러옵니다
5. 종목을 선택합니다 (또는 전체 내보내기)
6. 내보내기를 클릭하고 형식을 선택합니다

## 개인정보 보호

이 앱은:

- Apple Stocks 앱의 데이터만 읽습니다
- 인터넷에 연결하지 않습니다
- 어떠한 데이터도 수집하거나 전송하지 않습니다
- 모든 처리는 사용자의 Mac에서 로컬로 수행됩니다

## 라이선스

MIT 라이선스 — 자세한 내용은 [LICENSE](../../../LICENSE) 파일을 참고하세요.
