@testable import Succinct

internal enum TestEvaluationResultType: EvaluationResultType {
    case found
    case notFound

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
