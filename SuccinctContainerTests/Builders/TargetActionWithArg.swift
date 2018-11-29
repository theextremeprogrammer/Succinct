@testable import Succinct

final class TargetActionWithArg: NSObject {
    let callback: (Any) -> ()
    
    init(_ callback: @escaping (Any) -> ()) {
        self.callback = callback
    }
    
    @objc func action(sender: Any) {
        callback(sender)
    }
}
