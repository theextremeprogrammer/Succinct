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
    
    public func findSwitch(containedInView viewClass: AnyClass) -> UISwitch? {
        for subview in subviews {
            if subview.isKind(of: viewClass) {
                for subSubView in subview.subviews {
                    if let uiSwitch = subSubView as? UISwitch {
                        return uiSwitch
                    }
                }
            }
            
            if let uiSwitch = subview.findSwitch(containedInView: viewClass) {
                return uiSwitch
            }
        }

        return nil
    }
}
