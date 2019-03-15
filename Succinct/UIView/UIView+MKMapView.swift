import UIKit
import MapKit

// MARK: - Find MKMapView
extension UIView {
    public func findMapView() -> MKMapView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isMapView() })
        ) as? MKMapView
    }
}

fileprivate extension UIView {
    func isMapView() -> EvaluationResult {
        guard let _ = self as? MKMapView else {
            return .failure(FindMapViewFailure.wrongType)
        }

        let message = "**** Succinct: findMapView() Found MKMapView: \(self.memoryAddress)"
        Succinct.log.debug(message)

        return .success
    }
}

internal enum FindMapViewFailure: FailureResult {
    case wrongType

    var evaluatedMethod: String {
        get {
            return "findMapView()"
        }
    }

    var failureMessage: String {
        get {
            switch self {

            case .wrongType:
                return "\(evaluatedMethod) Failed to find an MKMapView"
            }
        }
    }
}
