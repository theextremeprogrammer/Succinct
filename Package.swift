// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Succinct",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Succinct",
            targets: ["Succinct"]
        ),
    ],
    targets: [
        .target(
            name: "Succinct",
            path: "Succinct",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "SuccinctTests",
            dependencies: ["Succinct"],
            path: "SuccinctTests",
            exclude: ["Info.plist"],
            resources: [
                .copy("Resources/TestImages.xcassets")
            ]
        )
    ]
)
