// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import SwiftUI

struct StockListView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        Group {
            switch viewModel.loadingState {
            case .idle:
                emptyStateView(
                    icon: "chart.line.uptrend.xyaxis",
                    title: L10n.string("list.ready_title"),
                    subtitle: L10n.string("list.ready_subtitle")
                )
            case .loading:
                loadingView
            case .loaded:
                if viewModel.stocks.isEmpty {
                    emptyStateView(
                        icon: "list.bullet.rectangle",
                        title: L10n.string("list.empty_title"),
                        subtitle: L10n.string("list.empty_subtitle")
                    )
                } else {
                    stockTable
                }
            case .error(let message, let kind):
                errorView(message: message, kind: kind)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var stockTable: some View {
        VStack(spacing: 0) {
            searchBar

            Table(viewModel.filteredStocks, selection: $viewModel.selectedStocks, sortOrder: $viewModel.sortOrder) {
                TableColumn(L10n.string("column.symbol"), value: \.symbol) { stock in
                    Text(stock.symbol)
                        .font(.system(.body, design: .monospaced, weight: .semibold))
                }
                .width(min: 60, ideal: 80)

                TableColumn(L10n.string("column.name"), value: \.name) { stock in
                    Text(stock.name)
                        .lineLimit(1)
                }
                .width(min: 150, ideal: 200)

                TableColumn(L10n.string("column.price")) { stock in
                    Text(stock.formattedPrice)
                        .font(.system(.body, design: .monospaced))
                }
                .width(min: 80, ideal: 100)

                TableColumn(L10n.string("column.change")) { stock in
                    HStack(spacing: 4) {
                        Image(systemName: stock.isPositive ? "arrow.up.right" : "arrow.down.right")
                            .font(.caption2)
                        Text(stock.formattedChange)
                            .font(.system(.body, design: .monospaced))
                    }
                    .foregroundStyle(stock.isPositive ? .green : .red)
                }
                .width(min: 80, ideal: 100)

                TableColumn(L10n.string("column.change_percent")) { stock in
                    Text(stock.formattedChangePercent)
                        .font(.system(.body, design: .monospaced))
                        .foregroundStyle(stock.isPositive ? .green : .red)
                }
                .width(min: 80, ideal: 100)
            }
            .tableStyle(.inset(alternatesRowBackgrounds: true))
            .onChange(of: viewModel.sortOrder) { _, newOrder in
                viewModel.stocks.sort(using: newOrder)
            }

            statusBar
        }
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField(L10n.string("list.search_placeholder"), text: $viewModel.searchText)
                .textFieldStyle(.plain)

            if !viewModel.searchText.isEmpty {
                Button {
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(8)
        .background(.quaternary)
    }

    private var statusBar: some View {
        HStack {
            Text(L10n.format("list.stocks_count", Int64(viewModel.filteredStocks.count)))
                .font(.caption)
                .foregroundStyle(.secondary)

            if !viewModel.selectedStocks.isEmpty {
                Text(L10n.format("list.selected_count", Int64(viewModel.selectedStocks.count)))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(.bar)
    }

    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)
            Text(L10n.string("list.loading"))
                .font(.headline)
                .foregroundStyle(.secondary)
        }
    }

    private func emptyStateView(icon: String, title: String, subtitle: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 48))
                .foregroundStyle(.tertiary)
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button {
                Task {
                    await viewModel.refresh()
                }
            } label: {
                Label(L10n.string("toolbar.refresh"), systemImage: "arrow.clockwise")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    private func errorView(message: String, kind: LoadingErrorKind) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(.orange)
            Text(L10n.string("list.error_title"))
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            HStack(spacing: 12) {
                if kind == .accessibilityNotAuthorized {
                    Button {
                        viewModel.requestAccessibilityPermission()
                    } label: {
                        Label(L10n.string("list.enable_access"), systemImage: "lock.open")
                    }
                    .buttonStyle(.bordered)
                }

                if kind == .stocksAppNotRunning {
                    Button {
                        viewModel.launchStocksApp()
                    } label: {
                        Label(L10n.string("list.launch_stocks"), systemImage: "play.fill")
                    }
                    .buttonStyle(.bordered)
                }

                Button {
                    Task {
                        await viewModel.refresh()
                    }
                } label: {
                    Label(L10n.string("list.retry"), systemImage: "arrow.clockwise")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

