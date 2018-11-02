import UIKit

extension UIViewController {
    public func hasLabel(withExactText searchText: String) -> Bool {
        return view.hasLabel(withExactText: searchText)
    }
    
    public func hasLabel(containingText searchText: String) -> Bool {
        return view.hasLabel(containingText: searchText)
    }
    
    public func findLabel(withExactText searchText: String) -> UILabel? {
        return view.findLabel(withExactText: searchText)
    }
    
    public func findLabel(containingText searchText: String) -> UILabel? {
        return view.findLabel(containingText: searchText)
    }
}
