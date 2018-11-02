import UIKit

extension UIViewController {
    public func tapLeftBarButtonItem() {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem,
            let action = leftBarButtonItem.action,
            let target = leftBarButtonItem.target {
            let _ = UIApplication.shared.sendAction(
                action,
                to: target,
                from: nil,
                for: nil
            )
        }
    }
}
