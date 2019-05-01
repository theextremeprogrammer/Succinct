extension UIViewController {
    public func hasStepper(expectedCount: Int = 1) -> Bool {
        let stepperCount = view.hasStepper(currentCount: 0)
        return stepperCount == expectedCount
    }
    
    public func adjustStepper(withTag tag: Int, byValue value: Int) {
        view.adjustStepper(withTag: tag, byValue: value)
    }
    
    public func containStepper(withTag tag: Int, toHaveValue desiredValue: Double) -> Bool {
        if let stepper = view.findStepper(withTag: tag) {
            return stepper.value == desiredValue
        }
        
        return false
    }
}
