extension UISlider {
    public func setValueAndFireTargetEvent(_ newValue: Float) {
        value = newValue
        sendActions(for: .valueChanged)
    }
}
