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

enum UIButtonEvaluationFailure {
    case wrongType
    case noTitleText(searchText: String)
    case matchFailed(searchText: String, actualText: String)
}

enum EvaluationResult {
    case success
    case failure(_ type: UIButtonEvaluationFailure)

    func debug() -> EvaluationResult {
        let header = "**** Succinct: "

        var detail = ""

        switch self {
        case .failure(let evaluationFailure):
            switch evaluationFailure {

            case .wrongType:
                detail = "Wrong type found"

            case .noTitleText(let searchText):
                detail = "findButton(withExactText: '\(searchText)')" +
                    " failed to match for button with title:" +
                    " nil (no title text set for this button)"

            case .matchFailed(let searchText, let actualText):
                detail = "findButton(withExactText: '\(searchText)')" +
                    " failed to match for button with title: '\(actualText)'"

            }

        default:
            detail = ""
        }

        let message = header + detail
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
}

fileprivate extension UIView {
    func isButton(withExactText searchText: String) -> EvaluationResult {
        guard let button = self as? UIButton else {
            return .failure(.wrongType)
        }

        guard let buttonText = button.title(for: .normal) else {
            return .failure(.noTitleText(searchText: searchText))
        }

        guard buttonText == searchText else {
            return .failure(.matchFailed(searchText: searchText, actualText: buttonText))
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
