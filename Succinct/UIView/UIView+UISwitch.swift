import UIKit

extension UIView {
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        var switchesCounted = 0
        
        for subview in subviews {
            if let _ = subview as? UISwitch {
                switchesCounted += 1
            }
            
            switchesCounted += subview.countOfSwitches(switchIsOn: switchIsOn)
        }
        
        return switchesCounted
    }
}
