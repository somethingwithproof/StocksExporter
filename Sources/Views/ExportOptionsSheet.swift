import SwiftUI

struct ExportOptionsSheet: View {
    @EnvironmentObject var viewModel: StocksViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var selectedFormat: ExportFormat = .csv
    @State private var showCopiedAlert = false

    var body: some View {
        VStack(spacing: 0) {
            headerView

            Divider()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    formatSection
                    columnsSection
                    previewSection
                }
                .padding(24)
            }

            Divider()

            footerView
        }
        .frame(width: 600, height: 550)
        .background(.background)
        .overlay(alignment: .top) {
            if showCopiedAlert {
                copiedAlert
            }
        }
    }

    private var headerView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Export Watchlist")
                    .font(.headline)
                Text("\(viewModel.selectedStockItems.count) stocks selected")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
        }
        .padding(16)
    }

    private var formatSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Format")
                .font(.subheadline.weight(.semibold))

            Picker("Format", selection: $selectedFormat) {
                ForEach(ExportFormat.allCases, id: \.self) { format in
                    Text(format.rawValue).tag(format)
                }
            }
            .pickerStyle(.segmented)
            .labelsHidden()

            if selectedFormat == .csv {
                Toggle("Include header row", isOn: $viewModel.exportSettings.includeHeader)
                    .font(.subheadline)
            }
        }
    }

    private var columnsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Columns to Export")
                .font(.subheadline.weight(.semibold))

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 8) {
                ForEach(viewModel.exportSettings.columns) { column in
                    Toggle(column.name, isOn: Binding(
                        get: { column.isEnabled },
                        set: { _ in viewModel.toggleColumn(column) }
                    ))
                    .toggleStyle(.checkbox)
                    .font(.subheadline)
                }
            }
        }
    }

    private var previewSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Preview")
                    .font(.subheadline.weight(.semibold))
                Spacer()
                Text("First 5 rows")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            ScrollView(.horizontal, showsIndicators: true) {
                Text(viewModel.generatePreview(format: selectedFormat))
                    .font(.system(.caption, design: .monospaced))
                    .textSelection(.enabled)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 150)
            .background(.quaternary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }

    private var footerView: some View {
        HStack {
            Button {
                viewModel.copyToClipboard(format: selectedFormat)
                showCopiedAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showCopiedAlert = false
                }
            } label: {
                Label("Copy", systemImage: "doc.on.doc")
            }
            .buttonStyle(.bordered)

            Spacer()

            Button("Cancel") {
                dismiss()
            }
            .keyboardShortcut(.cancelAction)

            Button {
                switch selectedFormat {
                case .csv:
                    viewModel.exportCSV()
                case .json:
                    viewModel.exportJSON()
                }
                dismiss()
            } label: {
                Label("Export", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.borderedProminent)
            .keyboardShortcut(.defaultAction)
        }
        .padding(16)
    }

    private var copiedAlert: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.green)
            Text("Copied to clipboard")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.regularMaterial)
        .clipShape(Capsule())
        .shadow(radius: 4)
        .padding(.top, 60)
        .transition(.move(edge: .top).combined(with: .opacity))
        .animation(.spring(response: 0.3), value: showCopiedAlert)
    }
}

