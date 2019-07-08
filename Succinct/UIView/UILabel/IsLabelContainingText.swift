internal extension UIView {
    func isLabel(containingText searchText: String) -> EvaluationResult {
        guard let label = self as? UILabel else {
            return .failure(IsLabelContainingTextResult.wrongType)
        }

        guard let labelText = label.text else {
            return .failure(IsLabelContainingTextResult.noText(searchText: searchText))
        }

        guard labelText.contains(searchText) else {
            return .failure(IsLabelContainingTextResult.matchFailed(
                searchText: searchText,
                actualText: labelText
            ))
        }

        return .success(IsLabelContainingTextResult.found)
    }
}

internal enum IsLabelContainingTextResult: EvaluationResultType {
    case found
    case wrongType
    case noText(searchText: String)
    case matchFailed(searchText: String, actualText: String)

    var evaluatedMethod: String {
        get {
            return ""
        }
    }

    var resultMessage: String? {
        get {
            switch self {
            default:
                return nil
            }
        }
    }
}
