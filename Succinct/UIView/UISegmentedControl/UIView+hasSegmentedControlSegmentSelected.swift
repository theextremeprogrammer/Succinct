internal extension UIView {
    func isSegmentedControl() -> EvaluationResult {
        guard let _ = self as? UISegmentedControl else {
            return EvaluationResult.failure(SegmentedControlSegmentSelectedResultType.wrongType)
        }

        return EvaluationResult.success(SegmentedControlSegmentSelectedResultType.found)
    }

    func isSegmentedControl(whereSelectedSegmentHasExactText searchText: String) -> EvaluationResult {
        guard let segmentedControl = self as? UISegmentedControl else {
            return EvaluationResult.failure(SegmentedControlSegmentSelectedResultType.wrongType)
        }

        let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
        let selectedSegmentTitle = segmentedControl.titleForSegment(at: selectedSegmentIndex)

        guard selectedSegmentTitle == searchText else {
            return EvaluationResult.failure(SegmentedControlSegmentSelectedResultType.matchFailed)
        }

        return EvaluationResult.success(SegmentedControlSegmentSelectedResultType.found)
    }
}

internal enum SegmentedControlSegmentSelectedResultType: EvaluationResultType {
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
