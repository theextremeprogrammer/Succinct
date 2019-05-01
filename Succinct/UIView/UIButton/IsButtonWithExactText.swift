internal extension UIView {
    func isButton(withExactText searchText: String) -> EvaluationResult {
        guard let button = self as? UIButton else {
            return .failure(IsButtonWithExactTextResultType.wrongType)
        }

        guard let buttonText = button.title(for: .normal) else {
            return .failure(IsButtonWithExactTextResultType.noTitleText(searchText: searchText))
        }

        guard buttonText == searchText else {
            return .failure(IsButtonWithExactTextResultType.matchFailed(searchText: searchText, actualText: buttonText))
        }

        return .success(IsButtonWithExactTextResultType.found)
    }
}

internal enum IsButtonWithExactTextResultType: EvaluationResultType {
    case found
    case wrongType
    case noTitleText(searchText: String)
    case matchFailed(searchText: String, actualText: String)

    var evaluatedMethod: String {
        get {
            return "findButton(withExactText:"
        }
    }

    var resultMessage: String {
        get {
            switch self {

            case .found:
                return ""

            case .wrongType:
                return "Wrong type found"

            case .noTitleText(let searchText):
                return "\(evaluatedMethod) '\(searchText)')" +
                    " failed to match for button with title:" +
                    " nil (no title text set for this button)"

            case .matchFailed(let searchText, let actualText):
                return "\(evaluatedMethod) '\(searchText)')" +
                    " failed to match for button with title: '\(actualText)'"
            }
        }
    }
}
