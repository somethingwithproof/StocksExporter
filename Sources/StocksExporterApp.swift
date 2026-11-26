// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import SwiftUI

@main
struct StocksExporterApp: App {
    @StateObject private var viewModel = StocksViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environment(\.layoutDirection, L10n.currentLayoutDirection)
        }
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: 800, height: 600)
        .commands {
            CommandGroup(replacing: .newItem) {}
            CommandGroup(after: .importExport) {
                Button(L10n.string("menu.export_csv")) {
                    viewModel.exportCSV()
                }
                .keyboardShortcut("e", modifiers: [.command])

                Button(L10n.string("menu.export_json")) {
                    viewModel.exportJSON()
                }
                .keyboardShortcut("e", modifiers: [.command, .shift])
            }
        }

        Settings {
            SettingsView()
                .environmentObject(viewModel)
                .environment(\.layoutDirection, L10n.currentLayoutDirection)
        }
    }
}
