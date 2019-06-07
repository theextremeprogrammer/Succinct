///
/// A SuccinctCondition encapsulates the conditional logic that should be applied when evaluating a UIView. The evaluation of this condition returns an EvaluationResult object which can indicate not only if the UIView met the specified condition, but for instances when the condition is not met then additional information can be communicated.
///
/// Additionally, but encapsulating the conditional logic in this object, additional processing can be performed for all conditionos, such as debug logging.
///
internal struct SuccinctCondition {
    /// The condition to evaluate against a UIView which will return an EvaluationResult
    /// which indicates if the condition was successful or not, and if not, why.
    private let condition: (UIView) -> EvaluationResult

    init(_ condition: @escaping (UIView) -> EvaluationResult) {
        self.condition = condition
    }

    ///
    /// Evaluates the condition associated with this object to the UIView that is passed in as an argument and then attempts to log the result of the evaluation.
    ///
    /// - Parameter view: The view to evaluation the condition against.
    /// - Returns: A boolean value indicating if the evaluation was successful or not.
    func evaluate(_ view: UIView) -> Bool {
        return condition(view)
            .tryDebug()
            .booleanResult()
    }
}
