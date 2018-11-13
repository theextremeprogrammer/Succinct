import UIKit

extension UIViewController {
    public func findButton(withExactText searchText: String) -> UIButton? {
        return view.findButton(withExactText: searchText)
    }
    
    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return view.findButton(withImage: searchImage)
    }
    
    public func hasButton(withExactText searchText: String) -> Bool {
        return view
            .findButton(withExactText: searchText)
            .isNotNil()
    }
    
    public func hasButton(withImage searchImage: UIImage) -> Bool {
        return view
            .findButton(withImage: searchImage)
            .isNotNil()
    }
    
    public func tapButton(withExactText searchText: String) {
        view.findButton(withExactText: searchText)?
            .tapAndFireTargetEvent()
    }
    
    public func tapButton(withImage searchImage: UIImage) {
        view.findButton(withImage: searchImage)?
            .tapAndFireTargetEvent()
    }
    
    public func findButtons(withState state: UIControl.State) -> [UIButton] {
        return view.findButtons(withState: state)
    }
}
