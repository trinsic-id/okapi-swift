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
                url: "https://github.com/trinsic-id/okapi/releases/download/v1.5.0/okapi.xcframework-1.5.0.zip",
                checksum: "5a16ed243d5e92750b4a4f6affa4d0314ef80acd10fca003a25fdb81b4aab2c7"),
            .testTarget(
                name: "OkapiTests",
                dependencies: ["Okapi"]),
        ]
)
