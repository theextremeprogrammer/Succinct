import UIKit

extension UIBarButtonItem {
    public var systemItem: SystemItem? {
        get {
            if let systemItemRawValue = value(forKey: "systemItem") as? Int {
                return SystemItem(rawValue: systemItemRawValue)
            }
            
            return nil
        }
    }
    
    public func tap() {
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
