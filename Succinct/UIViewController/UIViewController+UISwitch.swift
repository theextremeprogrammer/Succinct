import UIKit

extension UIViewController {
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        return view.countOfSwitches(switchIsOn: switchIsOn)
    }

    public func findSwitch<T>(containedInView viewClass: T.Type) -> UISwitch? where T: UIView {
        return view.findSwitch(containedInView: viewClass)
    }

    public func findSwitch(colocatedWithUILabelWithExactText searchText: String) -> UISwitch? {
        return view.findSwitch(colocatedWithUILabelWithExactText: searchText)
    }

    public func tapSwitch<T>(containedInView viewClass: T.Type) where T: UIView {
        view.findSwitch(containedInView: viewClass)?
            .tapAndFireTargetEvent()
    }

    public func tapSwitch(colocatedWithUILabelWithExactText searchText: String) {
        view.findSwitch(colocatedWithUILabelWithExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}
