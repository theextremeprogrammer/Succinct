import UIKit

// MARK: - UISlider
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UISlider whose value matches the searchValue exactly.
    ///
    /// - Parameter searchValue: Float value to compare to the value of any UISlider objects that are found.
    /// - Returns: A boolean value indicating if a UISlider object was found or not.
    ///
    @objc internal func hasSlider(withValue searchValue: Float) -> Bool {
        return findSlider(withValue: searchValue).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UISlider whose value matches the searchValue exactly.
    ///
    /// - Parameter searchValue: Float value to compare to the value of any UISlider objects that are found.
    /// - Returns: An optional UISlider, if one is found.
    ///
    @objc internal func findSlider(withValue searchValue: Float) -> UISlider? {
        for subview in subviews {
            if let slider = subview as? UISlider {
                if slider.value == searchValue {
                    return slider
                }
            }

            if let slider = subview.findSlider(withValue: searchValue) {
                return slider
            }
        }

        return nil
    }

    ///
    /// Searches the entire view hierarchy of the current view for any UISlider objects.
    ///
    /// - Returns: The total count of UISlider objects found.
    ///
    @objc public func sliderCount() -> Int {
        var sliderCount = 0

        for subview in subviews {
            if let _ = subview as? UISlider {
                sliderCount += 1
            }

            sliderCount += subview.sliderCount()
        }

        return sliderCount
    }
}
