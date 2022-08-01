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
                from: "1.19.1"),
        ],
        targets: [
            .target(
                name: "Okapi",
                dependencies: ["OkapiNative", "SwiftProtobuf"]),
            .binaryTarget(
                name: "OkapiNative",
                url: "https://github.com/trinsic-id/okapi/releases/download/v1.6.0/okapi.xcframework-1.6.0.zip",
                checksum: "c63d6e49b008473561420eb1b28333c727c6ac82293965c307e6b398621d57ef"),
            .testTarget(
                name: "OkapiTests",
                dependencies: ["Okapi"]),
        ]
)
