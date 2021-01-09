// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Gatekeeper",
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
                "Vapor"
            ]),
        .testTarget(
            name: "GatekeeperTests",
            dependencies: ["Gatekeeper"]),
    ]
)
