import MapKit

internal extension UIView {
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

    var resultMessage: String? {
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
