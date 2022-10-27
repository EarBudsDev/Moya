// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Moya",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
    .library(name: "Moya", targets: ["Moya"]),
    .library(name: "CombineMoya", targets: ["CombineMoya"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "4.0.0")), // dev
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")), // dev
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", .upToNextMajor(from: "9.0.0")) // dev
    ],
    targets: [
        .target(
            name: "Moya",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire")
            ],
            exclude: [
                "Supporting Files/Info.plist"
            ]
            ),
        .target(
            name: "CombineMoya",
            dependencies: [
                "Moya"
            ]
            ),
        .testTarget( // dev
                    name: "MoyaTests",  // dev
                    dependencies: [ // dev
                        "Moya", // dev
                        "CombineMoya", // dev
                        .product(name: "Quick", package: "Quick"), // dev
                        .product(name: "Nimble", package: "Nimble"), // dev
                        .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs") // dev
                    ] // dev
                    ) // dev
    ]
)

