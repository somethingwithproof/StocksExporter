// swift-tools-version: 5.9
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
