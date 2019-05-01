// MARK: - Searching by exact text
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose title for `UIControl.State.normal` matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the title for `UIControl.State.normal` of any UIButton objects that are found.
    /// - Returns: A boolean value indicating if a button was found or not.
    ///
    public func hasButton(withExactText searchText: String) -> Bool {
        return view
            .findButton(withExactText: searchText)
            .isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose title for `UIControl.State.normal` matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the title for `UIControl.State.normal` of any UIButton objects that are found.
    /// - Returns: An optional UIButton, if one is found.
    ///
    public func findButton(withExactText searchText: String) -> UIButton? {
        return view.findButton(withExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose title for `UIControl.State.normal` matches the searchText exactly and then attempts to tap the button by sending a `.touchUpInside` event to it.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the title for `UIControl.State.normal` of any UIButton objects that are found.
    ///
    public func tapButton(withExactText searchText: String) {
        view.findButton(withExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by image
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose image for `UIControl.State.normal` matches the searchImage.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchImage: Image to compare to the image for `UIControl.State.normal` of any UIButton objects that are found.
    /// - Returns: A boolean value indicating if a button was found or not.
    ///
    public func hasButton(withImage searchImage: UIImage) -> Bool {
        return view
            .findButton(withImage: searchImage)
            .isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose image for `UIControl.State.normal` matches the searchImage.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchImage: Image to compare to the image for `UIControl.State.normal` of any UIButton objects that are found.
    /// - Returns: An optional UIButton, if one is found.
    ///
    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return executeWithEnterAndExitDebugLog {
            if let button = view.findButton(withImage: searchImage) {
                return button
            }
            
            return nil
        } as? UIButton
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIButton whose image for `UIControl.State.normal` matches the searchImage and then attempts to tap the button by sending a `.touchUpInside` event to it.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchImage: Image to compare to the image for `UIControl.State.normal` of any UIButton objects that are found.
    ///
    public func tapButton(withImage searchImage: UIImage) {
        view.findButton(withImage: searchImage)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by state
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for all UIButton objects whose state matches the indicated state.
    ///
    /// - Parameter state: The `UIControl.State` to compare to any UIButton objects that are found.
    /// - Returns: An array of UIButton objects.
    ///
    public func findButtons(withState state: UIControl.State) -> [UIButton] {
        return view.findButtons(withState: state)
    }
}
