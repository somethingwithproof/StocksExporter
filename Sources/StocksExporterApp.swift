import SwiftUI

@main
struct StocksExporterApp: App {
    @StateObject private var viewModel = StocksViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: 800, height: 600)
        .commands {
            CommandGroup(replacing: .newItem) {}
            CommandGroup(after: .importExport) {
                Button("Export as CSV...") {
                    viewModel.exportCSV()
                }
                .keyboardShortcut("e", modifiers: [.command])

                Button("Export as JSON...") {
                    viewModel.exportJSON()
                }
                .keyboardShortcut("e", modifiers: [.command, .shift])
            }
        }

        Settings {
            SettingsView()
                .environmentObject(viewModel)
        }
    }
}
