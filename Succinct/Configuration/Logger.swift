internal class Logger {
    private var outputMethod: OutputMethod = PrintOutputMethod()
    
    func useOutputMethod(_ outputMethod: OutputMethod) {
        self.outputMethod = outputMethod
    }
    
    func useDefaultOutputMethod() {
        outputMethod = PrintOutputMethod()
    }
    
    func debug(_ message: String) {
        if Succinct.config.isDebuggingTurnedOn {
            outputMethod.standardPrint(message)
        }
    }
}
