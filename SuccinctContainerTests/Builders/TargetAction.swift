@testable import Succinct

final class TargetAction: NSObject {
    let callback: () -> Void

    init(_ callback: @escaping () -> Void) {
        self.callback = callback
    }

    @objc func action(sender: Any) {
        callback()
    }
}
