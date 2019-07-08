import MapKit

// MARK: - Find MKMapView
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for an MKMapView object.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional MKMapView, if one is found.
    ///
    public func findMapView() -> MKMapView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isMapView() })
        ) as? MKMapView
    }
}
