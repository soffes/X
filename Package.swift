// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "X",
    platforms: [
        .macOS("10.9"),
        .iOS("9.0"),
        .tvOS("9.0"),
        .watchOS("2.0")
    ],
    products: [
        .library(name: "X", targets: ["X"])
    ],
    targets: [
        .target(name: "X")
    ]
)
