///
/// Object which allows access to cofigurable options within Succinct.
///
public class SuccinctConfig {
    private(set) var isDebuggingTurnedOn: Bool = false

    ///
    /// Calling this function will turn debug logging **on** for all of Succinct.
    ///
    /// - Note: Debug logging is being added to Succinct (as of April 2019) and not all APIs support logging at the current time.
    ///
    /// - Warning: Enabling logging in Succinct outputs the view hierarchy information as view controllers and views are being searched which can have a negative impact on performance. It is recommended to turn debugging on only when you need to understand why a test may be failing unexpectedly.
    ///
    public func enableDebugLog() {
        isDebuggingTurnedOn = true
    }
    
    ///
    /// Calling this function will turn debug logging **off** for all of Succinct.
    ///
    /// - Note: Debug logging is being added to Succinct (as of April 2019) and not all APIs support logging at the current time.
    ///
    /// - Warning: Enabling logging in Succinct outputs the view hierarchy information as view controllers and views are being searched which can have a negative impact on performance. It is recommended to turn debugging on only when you need to understand why a test may be failing unexpectedly.
    ///
    public func disableDebugLog() {
        isDebuggingTurnedOn = false
    }
}
