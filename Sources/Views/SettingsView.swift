import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .environmentObject(viewModel)

            ExportSettingsView()
                .tabItem {
                    Label("Export", systemImage: "square.and.arrow.up")
                }
                .environmentObject(viewModel)

            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
        .frame(width: 450, height: 300)
    }
}

struct GeneralSettingsView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        Form {
            Section {
                Picker("Default data source", selection: $viewModel.dataSource) {
                    ForEach(DataSource.allCases, id: \.self) { source in
                        Text(source.rawValue).tag(source)
                    }
                }

                HStack {
                    Text("Accessibility access")
                    Spacer()
                    if viewModel.isAccessibilityAuthorized {
                        Label("Enabled", systemImage: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    } else {
                        Button("Enable") {
                            viewModel.requestAccessibilityPermission()
                        }
                    }
                }
            }
        }
        .formStyle(.grouped)
        .padding()
    }
}

struct ExportSettingsView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        Form {
            Section {
                Picker("Default format", selection: $viewModel.exportSettings.defaultFormat) {
                    ForEach(ExportFormat.allCases, id: \.self) { format in
                        Text(format.rawValue).tag(format)
                    }
                }

                Toggle("Include header row in CSV", isOn: $viewModel.exportSettings.includeHeader)
            }

            Section("Default Columns") {
                ForEach(viewModel.exportSettings.columns) { column in
                    Toggle(column.name, isOn: Binding(
                        get: { column.isEnabled },
                        set: { _ in viewModel.toggleColumn(column) }
                    ))
                }
            }
        }
        .formStyle(.grouped)
        .padding()
    }
}

struct AboutView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.system(size: 64))
                .foregroundStyle(.blue)

            Text("Stocks Exporter")
                .font(.title.weight(.semibold))

            Text("Version 1.0.0")
                .font(.caption)
                .foregroundStyle(.secondary)

            Text("Export your Apple Stocks watchlist to CSV or JSON format.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            Text("Made with SwiftUI")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding()
    }
}

