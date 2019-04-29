internal protocol OutputMethod {
    func standardPrint(_ message: String)
}

internal class PrintOutputMethod: OutputMethod {
    func standardPrint(_ message: String) {
        print(message)
    }
}
