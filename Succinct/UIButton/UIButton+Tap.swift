extension UIButton {
    ///
    /// Simulates tapping a UIButton control by sending the `.touchUpInside` event action.
    ///
    @objc public func tapAndFireTargetEvent() {
        sendActions(for: .touchUpInside)
    }
}
