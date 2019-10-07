// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "swiftpm",
	products: [
		.library(name: "App", targets: ["App"]),
		.executable(name: "Run", targets: ["Run"])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-log.git", from: "1.1.1")
	],
	targets: [
		.target(name: "App", dependencies: ["Logging"]),
		.target(name: "Run", dependencies: ["App"])
	]
)
