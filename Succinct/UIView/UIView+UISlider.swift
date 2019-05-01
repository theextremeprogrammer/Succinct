// MARK: - Finding UISliders
extension UIView {
    public func findSlider(withValue searchValue: Float) -> UISlider? {
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
}

// MARK: - Has UISliders
extension UIView {
    public func hasSlider(withValue searchValue: Float) -> Bool {
        return findSlider(withValue: searchValue).isNotNil()
    }
}

// MARK: - Slider Count
extension UIView {
    public func sliderCount() -> Int {
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
