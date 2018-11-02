import UIKit

extension UIViewController {
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
}
