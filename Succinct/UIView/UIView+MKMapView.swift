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
            let message = "**** Succinct: findMapView() Failed to find an MKMapView"
            Succinct.log.debug(message)

            return false
        }

        let message = "**** Succinct: findMapView() Found MKMapView: \(self.memoryAddress)"
        Succinct.log.debug(message)

        return true
    }
}
