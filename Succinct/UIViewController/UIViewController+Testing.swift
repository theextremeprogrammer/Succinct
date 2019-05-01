extension UIViewController {
    public func loadViewControllerForUnitTest() {
        view.setNeedsLayout()
    }
}
