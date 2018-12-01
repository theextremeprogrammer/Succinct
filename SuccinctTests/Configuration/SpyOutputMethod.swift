import Succinct

public final class SpyOutputMethod: OutputMethod {
    public init() {}
    
    public private(set) var standardPrint_argument_message: String? = nil
    public func standardPrint(_ message: String) {
        standardPrint_argument_message = message
    }
}
