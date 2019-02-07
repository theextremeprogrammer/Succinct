extension UIViewController {
    public func hasMapView() -> Bool {
        return view.findMapView().isNotNil()
    }
}
