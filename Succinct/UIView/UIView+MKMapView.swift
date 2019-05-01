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

fileprivate extension UIView {
    func isMapView() -> EvaluationResult {
        guard let _ = self as? MKMapView else {
            return .failure(FindMapViewResultType.wrongType)
        }

        return .success(FindMapViewResultType.found(memoryAddress: "\(self.memoryAddress)"))
    }
}

internal enum FindMapViewResultType: EvaluationResultType {
    case found(memoryAddress: String)
    case wrongType

    var evaluatedMethod: String {
        get {
            return "findMapView()"
        }
    }

    var resultMessage: String {
        get {
            switch self {

            case .found(let memoryAddress):
                return "\(evaluatedMethod) Found MKMapView: \(memoryAddress)"

            case .wrongType:
                return "\(evaluatedMethod) Failed to find an MKMapView"

            }
        }
    }
}
