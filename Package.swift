// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorPickerRow",
    products: [
        .library(
            name: "ColorPickerRow",
            targets: ["ColorPickerRow"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xmartlabs/Eureka.git", from: "5.3.2"),
        .package(name: "UIColorHexSwift", url: "https://github.com/yeahdongcn/UIColor-Hex-Swift.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "ColorPickerRow",
            dependencies: ["Eureka", "UIColorHexSwift"],
            path: "ColorPicker"),
    ]
)
