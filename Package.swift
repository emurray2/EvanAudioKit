// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EvanAudioKit",
    platforms: [
        .macOS(.v10_14), .iOS(.v11), .tvOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "EvanAudioKit",
            targets: ["EvanAudioKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/AudioKit/Soundpipe", .branch("main")),
        .package(url: "https://github.com/AudioKit/AudioKit", .branch("develop")),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "EvanAudioKit",
            dependencies: ["AudioKit", "CEvanAudioKit"]),
        .target(
            name: "CEvanAudioKit",
            dependencies: ["AudioKit", "Soundpipe"],
            exclude: [
            ],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath(".")]),
        .testTarget(
            name: "EvanAudioKitTests",
            dependencies: ["EvanAudioKit"],
            resources: [.copy("TestResources/")]),
    ],
    cxxLanguageStandard: .cxx14
)
