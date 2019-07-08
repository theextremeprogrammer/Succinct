extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for any UIPickerView.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIPickerView, if one is found.
    ///
    public func findPickerView() -> UIPickerView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition { $0.isPickerView() }
        ) as? UIPickerView
    }
}

fileprivate extension UIView {
    func isPickerView() -> EvaluationResult {
        guard self is UIPickerView else {
            return EvaluationResult.failure(IsDatePickerViewResultType.wrongType)
        }

        return EvaluationResult.success(IsDatePickerViewResultType.found)
    }
}

internal enum IsPickerViewResultType: EvaluationResultType  {
    case found
    case wrongType

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
