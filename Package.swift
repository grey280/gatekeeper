// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Gatekeeper",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Gatekeeper",
            targets: ["Gatekeeper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "Gatekeeper",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(
            name: "GatekeeperTests",
            dependencies: ["Gatekeeper"]),
    ]
)
