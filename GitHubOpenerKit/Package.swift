// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "GitHubOpenerKit",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "GitHubOpenerKit",
            targets: ["GitHubOpenerKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "GitHubOpenerKit",
            dependencies: []),
        .testTarget(
            name: "GitHubOpenerKitTests",
            dependencies: ["GitHubOpenerKit"]),
    ]
)
