import UIKit

// MARK: - Has UITextView
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    @objc internal func hasTextView(withExactText searchText: String) -> Bool {
        return findTextView(withExactText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text contains the searchText and has the provided searchAttributes.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Parameter searchAttributes: Attributes to compare to the attributes of the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    @objc internal func hasTextView(
        containingText searchText: String,
        matchingAttributes searchAttributes: [NSAttributedString.Key : Any]
    ) -> Bool {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({
                $0.isTextView(containingText: searchText, matchingAttributes: searchAttributes)
            })
        ).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    @objc internal func hasTextView(containingText searchText: String) -> Bool {
        return findTextView(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UITextView
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    @objc internal func findTextView(withExactText searchText: String) -> UITextView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isTextView(withExactText: searchText) })
        ) as? UITextView
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text contains the searchText and has the provided searchAttributes.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Parameter searchAttributes: Attributes to compare to the attributes of the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    @objc internal func findTextView(
        containingText searchText: String,
        matchingAttributes searchAttributes: [NSAttributedString.Key : Any]
    ) -> UITextView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({
                $0.isTextView(containingText: searchText, matchingAttributes: searchAttributes)
            })
        ) as? UITextView
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    @objc internal func findTextView(containingText searchText: String) -> UITextView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isTextView(containingText: searchText) })
        ) as? UITextView
    }
}

fileprivate extension UIView {
    func isTextView(withExactText searchText: String) -> EvaluationResult {
        guard let textfield = self as? UITextView else {
            return EvaluationResult.failure(IsTextViewResultType.wrongType)
        }

        guard let text = textfield.text else {
            return EvaluationResult.failure(IsTextViewResultType.textIsNil)
        }

        guard text == searchText else {
            return EvaluationResult.failure(IsTextViewResultType.matchFailed)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }

    func isTextView(
        containingText searchText: String,
        matchingAttributes searchAttributes: [NSAttributedString.Key : Any]
    ) -> EvaluationResult {
        guard let textView = self as? UITextView else {
            return EvaluationResult.failure(IsTextViewResultType.wrongType)
        }

        guard let attributedText = textView.attributedText else {
            return EvaluationResult.failure(IsTextViewResultType.attributedTextIsNil)
        }

        guard attributedText.containsExactString(searchText, withAttributes: searchAttributes) else {
            return EvaluationResult.failure(IsTextViewResultType.stringDoesNotContainText)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }

    func isTextView(containingText searchText: String) -> EvaluationResult {
        guard let textfield = self as? UITextView else {
            return EvaluationResult.failure(IsTextViewResultType.wrongType)
        }

        guard let text = textfield.text else {
            return EvaluationResult.failure(IsTextViewResultType.textIsNil)
        }

        guard text.contains(searchText) else {
            return EvaluationResult.failure(IsTextViewResultType.stringDoesNotContainText)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }
}

internal enum IsTextViewResultType: EvaluationResultType {
    case found
    case wrongType
    case textIsNil
    case attributedTextIsNil
    case matchFailed
    case stringDoesNotContainText

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
