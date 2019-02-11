@testable import Succinct

final class TargetAction: NSObject {
    let callback: (Any) -> Void
    
    init(_ callback: @escaping (Any) -> Void) {
        self.callback = callback
    }
    
    @objc func action(sender: Any) {
        callback(sender)
    }
}
