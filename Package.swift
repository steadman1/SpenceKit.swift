// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SpenceKit",
    platforms: [.iOS("15.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SpenceKit",
            targets: ["SpenceKit"]
        ),
    ],
    dependencies: [
        // Declare the external package dependency
        .package(url: "https://github.com/GeorgeElsham/ViewExtractor", from: "2.0.0")
    ],
    targets: [
        // Targets define the basic building blocks of a package, such as a module or a test suite.
        // Declare the SpenceKit target and make it depend on ViewExtractor
        .target(
            name: "SpenceKit",
            dependencies: [
                .product(name: "ViewExtractor", package: "ViewExtractor")
            ]
        ),
        .testTarget(
            name: "SpenceKitTests",
            dependencies: ["SpenceKit"]
        ),
    ]
)
