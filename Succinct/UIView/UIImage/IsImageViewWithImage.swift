internal extension UIView {
    func isImageView(withImage searchImage: UIImage) -> EvaluationResult {
        guard let imageView = self as? UIImageView else {
            return EvaluationResult.failure(IsImageViewWithImageResultType.wrongType)
        }

        guard imageView.image == searchImage else {
            return EvaluationResult.failure(IsImageViewWithImageResultType.matchFailed)
        }

        return EvaluationResult.success(IsImageViewWithImageResultType.found)
    }
}

internal enum IsImageViewWithImageResultType: EvaluationResultType {
    case found
    case wrongType
    case matchFailed

    var evaluatedMethod: String {
        get {
            return ""
        }
    }

    var resultMessage: String? {
        get {
            return nil
        }
    }
}
