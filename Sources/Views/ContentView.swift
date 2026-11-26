// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

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
            Label(L10n.string("toolbar.refresh"), systemImage: "arrow.clockwise")
        }
        .help(L10n.string("toolbar.refresh_help"))

        Spacer()

        if !viewModel.stocks.isEmpty {
            Button {
                showingExportOptions = true
            } label: {
                Label(L10n.string("toolbar.export"), systemImage: "square.and.arrow.up")
            }
            .help(L10n.string("toolbar.export_help"))
        }
    }
}

struct SidebarView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        List {
            Section(L10n.string("sidebar.data_source")) {
                Picker(L10n.string("sidebar.source"), selection: $viewModel.dataSource) {
                    ForEach(DataSource.allCases, id: \.self) { source in
                        Text(source.localizedName).tag(source)
                    }
                }
                .labelsHidden()
                .pickerStyle(.inline)
            }

            Section(L10n.string("sidebar.status")) {
                statusContent
            }

            if let lastRefresh = viewModel.lastRefresh {
                Section(L10n.string("sidebar.last_updated")) {
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
            Text(L10n.string("sidebar.accessibility"))
            Spacer()
            if !viewModel.isAccessibilityAuthorized {
                Button(L10n.string("sidebar.enable")) {
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
            Text(L10n.string("sidebar.stocks_app"))
            Spacer()
            if !viewModel.isStocksAppRunning {
                Button(L10n.string("sidebar.launch")) {
                    viewModel.launchStocksApp()
                }
                .buttonStyle(.link)
                .font(.caption)
            }
        }
    }
}

