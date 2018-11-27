import UIKit

extension UIViewController {
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        return view.countOfSwitches(switchIsOn: switchIsOn)
    }
    
    public func tapSwitch(containedInView viewClass: AnyClass) {
        for subview in view.subviews {
            if subview.isKind(of: viewClass) {
                for subSubView in subview.subviews {
                    if let uiSwitch = subSubView as? UISwitch {
                        uiSwitch.tapAndFireTargetEvent()
                        return
                    }
                }
            }
        }
    }
}
