extension UIViewController {
    @objc public func loadViewControllerForUnitTest() {
        view.setNeedsLayout()
    }
}
