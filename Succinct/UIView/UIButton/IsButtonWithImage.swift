import UIKit

internal extension UIView {
    func isButton(withImage searchImage: UIImage) -> EvaluationResult {
        guard let button = self as? UIButton else {
            return .failure(IsButtonWithImageFailure.wrongType)
        }

        guard let image = button.image(for: .normal) else {
            return .failure(IsButtonWithImageFailure.noNormalButtonImage)
        }

        guard image == searchImage else {
            return .failure(IsButtonWithImageFailure.matchFailed)
        }

        return .success(UIViewSuccess.found)
    }
}

internal enum IsButtonWithImageFailure: FailureResult {
    case wrongType
    case noNormalButtonImage
    case matchFailed

    var evaluatedMethod: String {
        get {
            return ""
        }
    }

    var failureMessage: String {
        get {
            return ""
        }
    }
}
