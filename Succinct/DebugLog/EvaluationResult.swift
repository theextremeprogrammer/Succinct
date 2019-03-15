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
