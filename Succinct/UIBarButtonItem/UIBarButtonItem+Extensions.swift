import UIKit

extension UIBarButtonItem {
    var systemItem: Int? {
        get {
            return value(forKey: "systemItem") as? Int
        }
    }
    
    func tap() {
        if let action = action,
            let target = target {
            _ = UIApplication.shared.sendAction(
                action,
                to: target,
                from: nil,
                for: nil
            )
        }
    }
}
