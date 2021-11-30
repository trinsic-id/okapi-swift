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
                url: "https://github.com/trinsic-id/okapi/releases/download/v1.2.0/okapi.xcframework-1.2.1.zip",
                checksum: "35550ed85edea75ad7ef22243a64750aa34bb7d24b5f5b52772b1793cc74557e"),
            .testTarget(
                name: "OkapiTests",
                dependencies: ["Okapi"]),
        ]
)
