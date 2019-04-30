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
    
    public func findSwitch<T>(containedInView viewClass: T.Type) -> UISwitch? where T: UIView {
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

    public func findSwitch(colocatedWithUILabelWithExactText searchText: String) -> UISwitch? {
        var matchingLabelWasFoundAtThisLevel = false

        for subview in subviews {
            if let label = subview as? UILabel,
               label.text == searchText {
                matchingLabelWasFoundAtThisLevel = true
            }
        }

        if matchingLabelWasFoundAtThisLevel {
            for subview in subviews {
                if let uiSwitch = subview as? UISwitch {
                    return uiSwitch
                }
            }
        }

        for subview in subviews {
            if let uiSwitch = subview.findSwitch(colocatedWithUILabelWithExactText: searchText) {
                return uiSwitch
            }
        }

        return nil
    }
}
