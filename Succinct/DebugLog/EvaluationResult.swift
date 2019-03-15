enum EvaluationResult {
    case success(_ result: SuccessResult)
    case failure(_ result: FailureResult)

    func tryDebug() -> EvaluationResult {
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
            case .success(let successfulResult):
                return successfulResult.successMessage

            case .failure(let evaluationFailure):
                return evaluationFailure.failureMessage
            }
        }
    }
}
