import UIKit
import MapKit

// MARK: - Find MKMapView
extension UIView {
    public func findMapView() -> MKMapView? {
        return findInSubviews(
            satisfyingCondition: { $0.isMapView() }
        ) as? MKMapView
    }
}

fileprivate extension UIView {
    func isMapView() -> Bool {
        guard let _ = self as? MKMapView else {
            return false
        }
        
        return true
    }
}
