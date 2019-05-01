extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for all UISwitch objects whose `isOn` property matches the provided value.
    ///
    /// - Parameter switchIsOn: Boolean value indicating if the UISwitch object is on or not.
    /// - Returns: A count for the total number of matching UISwitch objects.
    ///
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        return view.countOfSwitches(switchIsOn: switchIsOn)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UISwitch that is contained in a view of type `viewType`.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter viewType: Type of class to compare to the containing UIView object(s).
    /// - Returns: An optional UISwitch, if one is found.
    ///
    public func findSwitch<T>(containedInView viewType: T.Type) -> UISwitch? where T: UIView {
        return view.findSwitch(containedInView: viewType)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UISwitch that is contained in a view where a UILabel also exists whose `text` property matches the provided search text.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found within the same view as a UISwitch.
    /// - Returns: An optional UISwitch, if one is found.
    ///
    public func findSwitch(colocatedWithUILabelWithExactText searchText: String) -> UISwitch? {
        return view.findSwitch(colocatedWithUILabelWithExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UISwitch that is contained in a view of type `viewType`. If a UISwitch is found that matches this criteria, then it is tapped to fire its target `touchUpInside` event.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter viewType: Type of class to compare to the containing UIView object(s).
    ///
    public func tapSwitch<T>(containedInView viewType: T.Type) where T: UIView {
        view.findSwitch(containedInView: viewType)?
            .tapAndFireTargetEvent()
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UISwitch that is contained in a view where a UILabel also exists whose `text` property matches the provided search text. If a UISwitch is found that matches this criteria, then it is tapped to fire its target `touchUpInside` event.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found within the same view as a UISwitch.
    ///
    public func tapSwitch(colocatedWithUILabelWithExactText searchText: String) {
        view.findSwitch(colocatedWithUILabelWithExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}
