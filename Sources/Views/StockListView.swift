import SwiftUI

struct StockListView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        Group {
            switch viewModel.loadingState {
            case .idle:
                emptyStateView(
                    icon: "chart.line.uptrend.xyaxis",
                    title: "Ready to Load",
                    subtitle: "Click refresh to load your watchlist"
                )
            case .loading:
                loadingView
            case .loaded:
                if viewModel.stocks.isEmpty {
                    emptyStateView(
                        icon: "list.bullet.rectangle",
                        title: "No Stocks Found",
                        subtitle: "Add stocks to your Apple Stocks watchlist"
                    )
                } else {
                    stockTable
                }
            case .error(let message):
                errorView(message: message)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var stockTable: some View {
        VStack(spacing: 0) {
            searchBar

            Table(viewModel.filteredStocks, selection: $viewModel.selectedStocks, sortOrder: $viewModel.sortOrder) {
                TableColumn("Symbol", value: \.symbol) { stock in
                    Text(stock.symbol)
                        .font(.system(.body, design: .monospaced, weight: .semibold))
                }
                .width(min: 60, ideal: 80)

                TableColumn("Name", value: \.name) { stock in
                    Text(stock.name)
                        .lineLimit(1)
                }
                .width(min: 150, ideal: 200)

                TableColumn("Price") { stock in
                    Text(stock.formattedPrice)
                        .font(.system(.body, design: .monospaced))
                }
                .width(min: 80, ideal: 100)

                TableColumn("Change") { stock in
                    HStack(spacing: 4) {
                        Image(systemName: stock.isPositive ? "arrow.up.right" : "arrow.down.right")
                            .font(.caption2)
                        Text(stock.formattedChange)
                            .font(.system(.body, design: .monospaced))
                    }
                    .foregroundStyle(stock.isPositive ? .green : .red)
                }
                .width(min: 80, ideal: 100)

                TableColumn("Change %") { stock in
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
            TextField("Search stocks...", text: $viewModel.searchText)
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
            Text("\(viewModel.filteredStocks.count) stocks")
                .font(.caption)
                .foregroundStyle(.secondary)

            if !viewModel.selectedStocks.isEmpty {
                Text("• \(viewModel.selectedStocks.count) selected")
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
            Text("Loading watchlist...")
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
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(.orange)
            Text("Error Loading Data")
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            HStack(spacing: 12) {
                if message.contains("Accessibility") {
                    Button {
                        viewModel.requestAccessibilityPermission()
                    } label: {
                        Label("Enable Access", systemImage: "lock.open")
                    }
                    .buttonStyle(.bordered)
                }

                if message.contains("not running") {
                    Button {
                        viewModel.launchStocksApp()
                    } label: {
                        Label("Launch Stocks", systemImage: "play.fill")
                    }
                    .buttonStyle(.bordered)
                }

                Button {
                    Task {
                        await viewModel.refresh()
                    }
                } label: {
                    Label("Retry", systemImage: "arrow.clockwise")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

