public protocol OutputMethod {
    func standardPrint(_ message: String)
}

public class PrintOutputMethod: OutputMethod {
    public func standardPrint(_ message: String) {
        print(message)
    }
}
