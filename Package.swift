// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkComponentFileUpload",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SparkComponentFileUpload",
            targets: ["SparkComponentFileUpload"]
        ),
        .library(
            name: "SparkComponentFileUploadTesting",
            targets: ["SparkComponentFileUploadTesting"]
        )
    ],
    dependencies: [
       .package(
           url: "https://github.com/leboncoin/spark-ios-common.git",
           // path: "../spark-ios-common"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-component-button.git",
           // path: "../spark-ios-component-button"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-component-spinner.git",
           // path: "../spark-ios-component-spinner"
           /*version*/ "0.0.1"..."999.999.999"
       ),
       .package(
           url: "https://github.com/leboncoin/spark-ios-theming.git",
           // path: "../spark-ios-theming"
           /*version*/ "0.0.1"..."999.999.999"
       )
    ],
    targets: [
        .target(
            name: "SparkComponentFileUpload",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkComponentButton",
                    package: "spark-ios-component-button"
                ),
                .product(
                    name: "SparkComponentSpinner",
                    package: "spark-ios-component-spinner"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "SparkComponentFileUploadTesting",
            dependencies: [
                "SparkComponentFileUpload",
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkComponentButton",
                    package: "spark-ios-component-button"
                ),
                .product(
                    name: "SparkComponentSpinner",
                    package: "spark-ios-component-spinner"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ],
            path: "Sources/Testing",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SparkComponentFileUploadUnitTests",
            dependencies: [
                "SparkComponentFileUpload",
                "SparkComponentFileUploadTesting",
                .product(
                    name: "SparkCommonTesting",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkComponentButtonTesting",
                    package: "spark-ios-component-button"
                ),
                .product(
                    name: "SparkComponentSpinnerTesting",
                    package: "spark-ios-component-spinner"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                )
            ],
            path: "Tests/UnitTests"
        ),
        .testTarget(
            name: "SparkComponentFileUploadSnapshotTests",
            dependencies: [
                "SparkComponentFileUpload",
                "SparkComponentFileUploadTesting",
                .product(
                    name: "SparkCommonSnapshotTesting",
                    package: "spark-ios-common"
                )
            ],
            path: "Tests/SnapshotTests"
        )
    ]
)
