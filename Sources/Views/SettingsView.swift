// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: StocksViewModel

    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label(L10n.string("settings.tab_general"), systemImage: "gear")
                }
                .environmentObject(viewModel)

            ExportSettingsView()
                .tabItem {
                    Label(L10n.string("settings.tab_export"), systemImage: "square.and.arrow.up")
                }
                .environmentObject(viewModel)

            AboutView()
                .tabItem {
                    Label(L10n.string("settings.tab_about"), systemImage: "info.circle")
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
                Picker(L10n.string("settings.default_data_source"), selection: $viewModel.dataSource) {
                    ForEach(DataSource.allCases, id: \.self) { source in
                        Text(source.localizedName).tag(source)
                    }
                }

                HStack {
                    Text(L10n.string("settings.accessibility_access"))
                    Spacer()
                    if viewModel.isAccessibilityAuthorized {
                        Label(L10n.string("settings.enabled"), systemImage: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    } else {
                        Button(L10n.string("sidebar.enable")) {
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
                Picker(L10n.string("settings.default_format"), selection: $viewModel.exportSettings.defaultFormat) {
                    ForEach(ExportFormat.allCases, id: \.self) { format in
                        Text(format.rawValue).tag(format)
                    }
                }

                Toggle(L10n.string("settings.include_header_csv"), isOn: $viewModel.exportSettings.includeHeader)
            }

            Section(L10n.string("settings.default_columns")) {
                ForEach(viewModel.exportSettings.columns) { column in
                    Toggle(column.localizedName, isOn: Binding(
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

            Text(L10n.string("about.app_name"))
                .font(.title.weight(.semibold))

            Text(L10n.format("about.version", "1.0.0"))
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(L10n.string("about.description"))
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            Text(L10n.string("about.footer"))
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding()
    }
}

