extension UIButton {
    ///
    /// Simulates tapping a UIButton control by sending the `.touchUpInside` event action.
    ///
    public func tapAndFireTargetEvent() {
        sendActions(for: .touchUpInside)
    }
}
