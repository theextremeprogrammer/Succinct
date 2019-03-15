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

        return .success(FindMapViewSuccess.found(memoryAddress: "\(self.memoryAddress)"))
    }
}

internal enum FindMapViewSuccess: SuccessResult {
    case found(memoryAddress: String)

    var evaluatedMethod: String {
        get {
            return "findMapView()"
        }
    }

    var successMessage: String {
        get {
            switch self {
            case .found(let memoryAddress):
                return "\(evaluatedMethod) Found MKMapView: \(memoryAddress)"
            }
        }
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
