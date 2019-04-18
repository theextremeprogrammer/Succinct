import UIKit

// MARK: - Searching by exact text
extension UIViewController {
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose title matches the searchText exactly.
    ///
    /// - Note: Once a UIButton is found with the provided searchText the remainder of the view hierarchy **is not searched**.
    ///
    /// - Parameter searchText: Text to compare to the title of any UIButtons that are found.
    /// - Returns: A boolean value indicating if a button was found or not.
    public func hasButton(withExactText searchText: String) -> Bool {
        return view
            .findButton(withExactText: searchText)
            .isNotNil()
    }

    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose title matches the searchText exactly.
    ///
    /// - Note: Once a UIButton is found with the provided searchText the remainder of the view hierarchy **is not searched**.
    ///
    /// - Parameter searchText: Text to compare to the title of any UIButtons that are found.
    /// - Returns: An optional UIButton, if one is found.
    public func findButton(withExactText searchText: String) -> UIButton? {
        return view.findButton(withExactText: searchText)
    }

    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose title matches the searchText exactly and then attempts to tap the button by sending a `.touchUpInside` event to it.
    ///
    /// - Note: Once a UIButton is found with the provided searchText the remainder of the view hierarchy **is not searched**.
    ///
    /// - Parameter searchText: Text to compare to the title of any UIButtons that are found.
    public func tapButton(withExactText searchText: String) {
        view.findButton(withExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by image
extension UIViewController {
    public func hasButton(withImage searchImage: UIImage) -> Bool {
        return view
            .findButton(withImage: searchImage)
            .isNotNil()
    }

    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return executeWithEnterAndExitDebugLog {
            if let button = view.findButton(withImage: searchImage) {
                return button
            }
            
            return nil
        } as? UIButton
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
