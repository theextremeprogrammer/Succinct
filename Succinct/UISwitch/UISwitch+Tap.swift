extension UISwitch {
    ///
    /// Simulates tapping a UISwitch control by sending the `.touchUpInside` event action. Since simply sending the action does not change the state of the UISwitch, this method also flips the `isOn` property to simulate the effect tapping the switch would actually have.
    ///
    public func tapAndFireTargetEvent() {
        isOn = !isOn
        sendActions(for: .touchUpInside)
    }
}
