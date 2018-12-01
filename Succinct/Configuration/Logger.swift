public class Logger {
    private var outputMethod: OutputMethod = PrintOutputMethod()
    
    public func useOutputMethod(_ outputMethod: OutputMethod) {
        self.outputMethod = outputMethod
    }
    
    public func useDefaultOutputMethod() {
        outputMethod = PrintOutputMethod()
    }
    
    public func debug(_ message: String) {
        if Succinct.config.isDebuggingTurnedOn {
            outputMethod.standardPrint(message)
        }
    }
}
