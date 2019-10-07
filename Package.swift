// swift-tools-version:5.1
import PackageDescription

let package = Package(
  name: "swiftpm",
  products: [
    .library(name: "App", targets: ["App"]),
    .executable(name: "Run", targets: ["Run"])
  ],
  dependencies: [],
  targets: [
    .target(name: "App", dependencies: []),
    .target(name: "Run", dependencies: ["App"])
  ]
)
