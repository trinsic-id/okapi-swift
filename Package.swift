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
                url: "https://github.com/trinsic-id/okapi/releases/download/v1.4.0/okapi.xcframework-1.4.0.zip",
                checksum: "84d7d48d1a954a87afb718b5ebcdc61f68e49b618e81d1e3cc5607cc24964f22"),
            .testTarget(
                name: "OkapiTests",
                dependencies: ["Okapi"]),
        ]
)
