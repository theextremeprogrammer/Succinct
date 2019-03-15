protocol SuccessResult {
    var evaluatedMethod: String { get }
    var successMessage: String { get }
}

protocol FailureResult {
    var evaluatedMethod: String { get }
    var failureMessage: String { get }
}
