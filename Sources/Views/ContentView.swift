import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: StocksViewModel
    @State private var showingExportOptions = false

    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            StockListView()
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                toolbarContent
            }
        }
        .sheet(isPresented: $showingExportOptions) {
            ExportOptionsSheet()
        }
        .task {
            await viewModel.refresh()
        }
    }

    @ViewBuilder
    private var toolbarContent: some View {
        Button {
            Task {
                await viewModel.refresh()
            }
        } label: {
            Label("Refresh", systemImage: "arrow.clockwise")
        }
        .help("Refresh watchlist")

        Spacer()

        if !viewModel.stocks.isEmpty {
            Button {
                showingExportOptions = true
            } label: {
                Label("Export", systemImage: "square.and.arrow.up")
            }
            .help("Export watchlist")
        }
    }
}

struct SidebarView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        List {
            Section("Data Source") {
                Picker("Source", selection: $viewModel.dataSource) {
                    ForEach(DataSource.allCases, id: \.self) { source in
                        Text(source.rawValue).tag(source)
                    }
                }
                .labelsHidden()
                .pickerStyle(.inline)
            }

            Section("Status") {
                statusContent
            }

            if let lastRefresh = viewModel.lastRefresh {
                Section("Last Updated") {
                    Text(lastRefresh, style: .relative)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .listStyle(.sidebar)
        .frame(minWidth: 200)
    }

    @ViewBuilder
    private var statusContent: some View {
        HStack {
            Circle()
                .fill(viewModel.isAccessibilityAuthorized ? .green : .orange)
                .frame(width: 8, height: 8)
            Text("Accessibility")
            Spacer()
            if !viewModel.isAccessibilityAuthorized {
                Button("Enable") {
                    viewModel.requestAccessibilityPermission()
                }
                .buttonStyle(.link)
                .font(.caption)
            }
        }

        HStack {
            Circle()
                .fill(viewModel.isStocksAppRunning ? .green : .gray)
                .frame(width: 8, height: 8)
            Text("Stocks App")
            Spacer()
            if !viewModel.isStocksAppRunning {
                Button("Launch") {
                    viewModel.launchStocksApp()
                }
                .buttonStyle(.link)
                .font(.caption)
            }
        }
    }
}

