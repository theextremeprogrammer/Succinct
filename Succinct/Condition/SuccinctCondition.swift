public struct SuccinctCondition {
    private let condition: (UIView) -> EvaluationResult

    init(_ condition: @escaping (UIView) -> EvaluationResult) {
        self.condition = condition
    }

    func evaluate(_ view: UIView) -> Bool {
        return condition(view)
            .tryDebug()
            .booleanResult()
    }
}
