import UIKit
import MapKit

extension UIView {
    public func hasMapView() -> Bool {
        var result = false

        for subview in self.subviews {
            if let _ = subview as? MKMapView {
                result = true
                break
            }

            if subview.hasMapView() {
                result = true
                break
            }
        }

        return result
    }
}
