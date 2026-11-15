// swift-tools-version: 5.9
// SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
// SPDX-License-Identifier: MIT

import PackageDescription

let package = Package(
    name: "StocksExporter",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "StocksExporter", targets: ["StocksExporter"])
    ],
    targets: [
        .executableTarget(
            name: "StocksExporter",
            path: "Sources"
        )
    ]
)
