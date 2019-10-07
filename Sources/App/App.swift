import Logging

public func log(_ message: String) {
	Logger(label: "codes.slashmo.swiftpm").info(Logger.Message(stringLiteral: message))
}
