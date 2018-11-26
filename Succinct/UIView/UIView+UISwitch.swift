import UIKit

extension UIView {
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        var switchesCounted = 0
        
        for subview in subviews {
            if let uiSwitch = subview as? UISwitch,
                uiSwitch.isOn == switchIsOn {
                switchesCounted += 1
            }
            
            switchesCounted += subview.countOfSwitches(switchIsOn: switchIsOn)
        }
        
        return switchesCounted
    }
}
