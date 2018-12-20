import UIKit

// MARK: - Searching by text
extension UIViewController {
    public func findButton(withExactText searchText: String) -> UIButton? {
        return view.findButton(withExactText: searchText)
    }

    public func hasButton(withExactText searchText: String) -> Bool {
        return view
            .findButton(withExactText: searchText)
            .isNotNil()
    }

    public func tapButton(withExactText searchText: String) {
        view.findButton(withExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by image
extension UIViewController {
    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        Succinct.log.debug("<\(String(describing: type(of: self)))>")

        if let button = view.findButton(withImage: searchImage) {
            return button
        }
        
        Succinct.log.debug("</\(String(describing: type(of: self)))>")
        return nil
    }

    public func hasButton(withImage searchImage: UIImage) -> Bool {
        return view
            .findButton(withImage: searchImage)
            .isNotNil()
    }

    public func tapButton(withImage searchImage: UIImage) {
        view.findButton(withImage: searchImage)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by state
extension UIViewController {
    public func findButtons(withState state: UIControl.State) -> [UIButton] {
        return view.findButtons(withState: state)
    }
}
