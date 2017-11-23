import UIKit

extension UIView {
    func findButton(withText searchText: String) -> UIButton? {
        for subview in subviews {
            if let button = subview as? UIButton {
                if (button.titleLabel?.text == searchText) {
                    return button
                }
            }

            if (subview.subviews.count > 0) {
                if let button = subview.findButton(withText: searchText) {
                    return button
                }
            }
        }

        return nil
    }
}
