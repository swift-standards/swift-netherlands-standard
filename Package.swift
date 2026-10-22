// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-netherlands-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Netherlands Standard", targets: ["Netherlands Standard"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-iso/swift-iso-7064.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Netherlands Standard",
            dependencies: [
                .product(name: "ISO 7064", package: "swift-iso-7064")
            ]
        ),
        .testTarget(
            name: "Netherlands Standard Tests",
            dependencies: [
                .target(name: "Netherlands Standard")
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
