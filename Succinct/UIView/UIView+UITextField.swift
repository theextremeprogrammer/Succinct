import UIKit

// MARK: - Has UITextFields
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    @objc internal func hasTextField(withExactPlaceholderText searchText: String) -> Bool {
        return findTextField(withExactPlaceholderText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    @objc internal func hasTextField(containingPlaceholderText searchText: String) -> Bool {
        return findTextField(containingPlaceholderText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    @objc internal func hasTextField(withExactText searchText: String) -> Bool {
        return findTextField(withExactText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    @objc internal func hasTextField(containingText searchText: String) -> Bool {
        return findTextField(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UITextFields
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    @objc internal func findTextField(withExactPlaceholderText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isTextField(withExactPlaceholderText: searchText) })
        ) as? UITextField
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    @objc internal func findTextField(containingPlaceholderText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isTextField(containingPlaceholderText: searchText) })
        ) as? UITextField
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    @objc internal func findTextField(withExactText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isTextField(withExactText: searchText) })
        ) as? UITextField
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    @objc internal func findTextField(containingText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isTextField(containingText: searchText) })
        ) as? UITextField
    }
}

fileprivate extension UIView {
    func isTextField(withExactPlaceholderText searchText: String) -> EvaluationResult {
        guard let textfield = self as? UITextField else {
            return EvaluationResult.failure(IsTextFieldResultType.wrongType)
        }
        
        guard let placeholderText = textfield.placeholder else {
            return EvaluationResult.failure(IsTextFieldResultType.placeholderTextIsNil)
        }
        
        guard placeholderText == searchText else {
            return EvaluationResult.failure(IsTextFieldResultType.matchFailed)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }
    
    func isTextField(containingPlaceholderText searchText: String) -> EvaluationResult {
        guard let textfield = self as? UITextField else {
            return EvaluationResult.failure(IsTextFieldResultType.wrongType)
        }
        
        guard let placeholderText = textfield.placeholder else {
            return EvaluationResult.failure(IsTextFieldResultType.placeholderTextIsNil)
        }
        
        guard placeholderText.contains(searchText) else {
            return EvaluationResult.failure(IsTextFieldResultType.stringDoesNotContainText)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }

    func isTextField(withExactText searchText: String) -> EvaluationResult {
        guard let textfield = self as? UITextField else {
            return EvaluationResult.failure(IsTextFieldResultType.wrongType)
        }
        
        guard let text = textfield.text else {
            return EvaluationResult.failure(IsTextFieldResultType.textIsNil)
        }
        
        guard text == searchText else {
            return EvaluationResult.failure(IsTextFieldResultType.matchFailed)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }

    func isTextField(containingText searchText: String) -> EvaluationResult {
        guard let textfield = self as? UITextField else {
            return EvaluationResult.failure(IsTextFieldResultType.wrongType)
        }
        
        guard let text = textfield.text else {
            return EvaluationResult.failure(IsTextFieldResultType.textIsNil)
        }

        guard text.contains(searchText) else {
            return EvaluationResult.failure(IsTextFieldResultType.stringDoesNotContainText)
        }

        return EvaluationResult.success(IsTextViewResultType.found)
    }
}

internal enum IsTextFieldResultType: EvaluationResultType {
    case found
    case wrongType
    case textIsNil
    case placeholderTextIsNil
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
