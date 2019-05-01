extension UIViewController {
    public func hasSlider(withValue searchValue: Float) -> Bool {
        return view.hasSlider(withValue: searchValue)
    }
    
    public func sliderCount() -> Int {
        return view.sliderCount()
    }
    
    public func setValueOf(sliderWithValue searchValue: Float, toValue newValue: Float) {
        if let slider = view.findSlider(withValue: searchValue) {
            slider.setValueAndFireTargetEvent(newValue)
        }
    }
}
