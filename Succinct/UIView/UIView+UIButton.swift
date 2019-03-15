import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        let condition = SuccinctCondition({
            $0.isButton(withExactText: searchText)
        })

        return findInSubviews(satisfyingCondition: condition) as? UIButton
    }

    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return findInSubviews(
            satisfyingCondition: {
                $0.isButton(withImage: searchImage)
            }
        ) as? UIButton
    }

    public func findButtons(withState searchState: UIControl.State) -> [UIButton] {
        var buttons: [UIButton] = []

        for subview in subviews {
            if let button = subview as? UIButton {
                if button.state == searchState {
                    buttons.append(button)
                }
            }

            if let tableView = subview as? UITableView {
                for section in 0..<tableView.numberOfSections {
                    if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                        buttons += (headerView.findButtons(withState: searchState))
                    }

                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            buttons += (cell.findButtons(withState: searchState))
                        }
                    }
                }
            }

            buttons.append(contentsOf: subview.findButtons(withState: searchState))
        }

        return buttons
    }
}

protocol FailureResult {
    var evaluatedMethod: String { get }
    var failureMessage: String { get }
}

enum IsButtonWithExactTextFailure: FailureResult {
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

enum EvaluationResult {
    case success
    case failure(_ result: FailureResult)

    func debug() -> EvaluationResult {
        let message = "**** Succinct: " + messageDetail
        Succinct.log.debug(message)

        return self
    }

    func booleanResult() -> Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }

    private var messageDetail: String {
        get {
            switch self {
            case .success:
                return "Successful"

            case .failure(let evaluationFailure):
                return evaluationFailure.failureMessage
            }
        }
    }
}

fileprivate extension UIView {
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

        return .success
    }

    func isButton(withImage searchImage: UIImage) -> Bool {
        guard let button = self as? UIButton else {
            return false
        }

        guard let image = button.image(for: .normal) else {
            return false
        }

        return image == searchImage
    }
}
