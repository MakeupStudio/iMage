// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iMage",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_10),
    ],
    products: [
        .library(
            name: "iMage",
            targets: ["iMage"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "iMage",
            dependencies: []),
        .testTarget(
            name: "iMageTests",
            dependencies: ["iMage"]),
    ]
)
