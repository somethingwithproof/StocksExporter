[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Một ứng dụng macOS gốc giúp xuất danh sách theo dõi Apple Stocks của bạn sang định dạng CSV hoặc JSON.

Apple không cung cấp cách chính thức để xuất dữ liệu danh sách theo dõi Stocks. Ứng dụng này giải quyết vấn đề đó bằng hai phương pháp bổ sung cho nhau:

1. **API Trợ năng (Accessibility API)** — Đọc giao diện của Stocks.app đang chạy theo thời gian thực
2. **Bộ nhớ đệm tiện ích (Widget Cache)** — Phân tích các tệp bộ nhớ đệm lưu cục bộ khi ứng dụng không chạy

## Tính năng

- **Giao diện SwiftUI gốc** hỗ trợ chế độ tối và bố cục RTL
- **Nhiều nguồn dữ liệu** — API Trợ năng hoặc phân tích bộ nhớ đệm
- **Xuất sang CSV hoặc JSON** với các cột có thể tùy chỉnh
- **Xem trước trước khi xuất** — Kiểm tra chính xác dữ liệu bạn sắp xuất
- **Chọn cột** — Chọn các trường dữ liệu cần bao gồm
- **Sao chép vào bảng nhớ tạm** — Xuất nhanh mà không cần lưu tệp
- **Lưu tùy chọn bền vững** — Ghi nhớ các thiết lập xuất của bạn
- **Giao diện đa ngôn ngữ** — Hỗ trợ 45 ngôn ngữ

## Ngôn ngữ được hỗ trợ

Stocks Exporter sử dụng tùy chọn ngôn ngữ hệ thống của macOS và đi kèm bản địa hóa giao diện đầy đủ cho 45 ngôn ngữ (bao gồm hỗ trợ bố cục phải sang trái tự động cho tiếng Ả Rập, Ba Tư, Do Thái và Urdu). Xem danh sách đầy đủ trong [README tiếng Anh](../../../README.md#supported-languages).

## Yêu cầu

- macOS 14.0 (Sonoma) trở lên
- Quyền Trợ năng (để đọc dữ liệu trực tiếp từ Stocks.app)

## Biên dịch

```bash
swift build
swift run
```

Hoặc mở dự án trong Xcode và biên dịch.

## Cách sử dụng

1. Khởi chạy ứng dụng
2. Cấp quyền Trợ năng khi được yêu cầu (để lấy dữ liệu trực tiếp)
3. Mở ứng dụng Apple Stocks (không bắt buộc, để có kết quả tốt nhất)
4. Nhấp Làm mới để tải danh sách theo dõi của bạn
5. Chọn cổ phiếu (hoặc xuất tất cả)
6. Nhấp Xuất và chọn định dạng

## Quyền riêng tư

Ứng dụng này:

- Chỉ đọc dữ liệu từ ứng dụng Apple Stocks
- Không kết nối internet
- Không thu thập hay truyền tải bất kỳ dữ liệu nào
- Thực hiện toàn bộ quá trình xử lý cục bộ trên máy Mac của bạn

## Giấy phép

Giấy phép MIT — xem tệp [LICENSE](../../../LICENSE) để biết chi tiết.
