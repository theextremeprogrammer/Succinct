extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for all UISwitch objects whose `isOn` property matches the provided value.
    ///
    /// - Parameter switchIsOn: Boolean value indicating if the UISwitch object is on or not.
    /// - Returns: The total number of matching UISwitch objects.
    ///
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        var switchesCounted = 0
        
        for subview in subviews {
            if let uiSwitch = subview as? UISwitch,
                uiSwitch.isOn == switchIsOn {
                switchesCounted += 1
            }
            
            switchesCounted += subview.countOfSwitches(switchIsOn: switchIsOn)
        }
        
        return switchesCounted
    }
    
    ///
    /// Searches the entire view hierarchy of the current view for a UISwitch that is contained in a view of type `viewType`.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter viewType: Type of class to compare to the containing UIView object(s).
    /// - Returns: An optional UISwitch, if one is found.
    ///
    public func findSwitch<T>(containedInView viewType: T.Type) -> UISwitch? where T: UIView {
        for subview in subviews {
            if subview.isKind(of: viewType) {
                for subSubView in subview.subviews {
                    if let uiSwitch = subSubView as? UISwitch {
                        return uiSwitch
                    }
                }
            }
            
            if let uiSwitch = subview.findSwitch(containedInView: viewType) {
                return uiSwitch
            }
        }

        return nil
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UISwitch that is contained in a view where a UILabel also exists whose `text` property matches the provided search text.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found within the same view as a UISwitch.
    /// - Returns: An optional UISwitch, if one is found.
    ///
    public func findSwitch(colocatedWithUILabelWithExactText searchText: String) -> UISwitch? {
        var matchingLabelWasFoundAtThisLevel = false

        for subview in subviews {
            if let label = subview as? UILabel,
               label.text == searchText {
                matchingLabelWasFoundAtThisLevel = true
            }
        }

        if matchingLabelWasFoundAtThisLevel {
            for subview in subviews {
                if let uiSwitch = subview as? UISwitch {
                    return uiSwitch
                }
            }
        }

        for subview in subviews {
            if let uiSwitch = subview.findSwitch(colocatedWithUILabelWithExactText: searchText) {
                return uiSwitch
            }
        }

        return nil
    }
}
