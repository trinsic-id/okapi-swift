// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
        name: "Okapi",
        platforms: [
            .iOS(.v13),
            .macOS(.v11)
        ],
        products: [
            .library(
                name: "Okapi",
                targets: ["Okapi"]),
        ],
        dependencies: [
            .package(
                name: "SwiftProtobuf",
                url: "https://github.com/apple/swift-protobuf.git",
                from: "1.18.0"),
        ],
        targets: [
            .target(
                name: "Okapi",
                dependencies: ["OkapiNative", "SwiftProtobuf"]),
            .binaryTarget(
                name: "OkapiNative",
                url: "https://github.com/trinsic-id/okapi/releases/download/v1.3.0/okapi.xcframework-1.3.0.zip",
                checksum: "6a99fd1292ffad5fcc279aa7b5687131849ec584d2c61c0c38c63940029419c3"),
            .testTarget(
                name: "OkapiTests",
                dependencies: ["Okapi"]),
        ]
)
