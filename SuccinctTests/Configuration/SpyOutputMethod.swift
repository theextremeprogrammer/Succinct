@testable import Succinct

public final class SpyOutputMethod: OutputMethod {
    public init() {}
    
    public private(set) var standardPrint_argument_message: String? = nil
    public private(set) var standardPrint_argument_messages: [String] = []
    public func standardPrint(_ message: String) {
        debugPrint(message)
        standardPrint_argument_message = message
        standardPrint_argument_messages.append(message)
    }
}
