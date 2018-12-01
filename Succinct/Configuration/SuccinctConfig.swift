public class SuccinctConfig {
    private(set) var isDebuggingTurnedOn: Bool = false
    
    public func enableDebugLog() {
        isDebuggingTurnedOn = true
    }
    
    public func disableDebugLog() {
        isDebuggingTurnedOn = false
    }
}
