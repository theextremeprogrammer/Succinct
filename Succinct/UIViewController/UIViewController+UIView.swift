import UIKit

extension UIViewController {
    public func containsView(withBackgroundColor searchColor: UIColor) -> Bool {
        return view.containsView(withBackgroundColor: searchColor)
    }
    
    public func countOfViews(withBackgroundColor searchColor: UIColor) -> Int {
        return view.countOfViews(withBackgroundColor: searchColor)
    }
}
