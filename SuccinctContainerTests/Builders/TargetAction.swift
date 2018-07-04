@testable import Succinct

final class TargetAction: NSObject {
    let callback: () -> ()

    init(_ callback: @escaping () -> ()) {
        self.callback = callback
    }

    @objc func action(sender: Any) {
        callback()
    }
}
