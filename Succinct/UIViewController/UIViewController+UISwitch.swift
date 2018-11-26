import UIKit

extension UIViewController {
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        var switchesCounted = 0
        
        for subview in view.subviews {
            if let _ = subview as? UISwitch {
                switchesCounted += 1
            }
        }
        
        return switchesCounted
    }
}
