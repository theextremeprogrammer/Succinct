import UIKit

internal extension UIView {
    func isButton(withExactText searchText: String) -> EvaluationResult {
        guard let button = self as? UIButton else {
            return .failure(IsButtonWithExactTextFailure.wrongType)
        }

        guard let buttonText = button.title(for: .normal) else {
            return .failure(IsButtonWithExactTextFailure.noTitleText(searchText: searchText))
        }

        guard buttonText == searchText else {
            return .failure(IsButtonWithExactTextFailure.matchFailed(searchText: searchText, actualText: buttonText))
        }

        return .success(UIViewSuccess.found)
    }
}

internal enum UIViewSuccess: SuccessResult {
    case found

    var evaluatedMethod: String {
        get {
            return ""
        }
    }

    var successMessage: String {
        get {
            return ""
        }
    }
}

internal enum IsButtonWithExactTextFailure: FailureResult {
    case wrongType
    case noTitleText(searchText: String)
    case matchFailed(searchText: String, actualText: String)

    var evaluatedMethod: String {
        get {
            return "findButton(withExactText:"
        }
    }

    var failureMessage: String {
        get {
            switch self {

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
