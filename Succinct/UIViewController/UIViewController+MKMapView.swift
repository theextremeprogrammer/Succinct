import MapKit

extension UIViewController {
    public func hasMapView() -> Bool {
        return view.findMapView().isNotNil()
    }

    public func findMapView() -> MKMapView? {
        return view.findMapView()
    }
}
