import UIKit
import MapKit

extension UIView {
    public func findMapView() -> MKMapView? {
        for subview in subviews {
            if let mapView = subview as? MKMapView {
                return mapView
            }

            if let mapView = subview.findMapView() {
                return mapView
            }
        }

        return nil
    }
}
