internal extension UIView {
    func isButton(withImage searchImage: UIImage) -> EvaluationResult {
        guard let button = self as? UIButton else {
            return .failure(IsButtonWithImageResultType.wrongType)
        }

        guard let image = button.image(for: .normal) else {
            return .failure(IsButtonWithImageResultType.noNormalButtonImage)
        }

        guard image == searchImage else {
            return .failure(IsButtonWithImageResultType.matchFailed)
        }

        return .success(IsButtonWithImageResultType.found)
    }
}

internal enum IsButtonWithImageResultType: EvaluationResultType {
    case found
    case wrongType
    case noNormalButtonImage
    case matchFailed

    var evaluatedMethod: String {
        get {
            return ""
        }
    }

    var resultMessage: String {
        get {
            return ""
        }
    }
}
