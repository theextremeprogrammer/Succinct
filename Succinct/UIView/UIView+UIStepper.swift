extension UIView {
    public func hasStepper(currentCount: Int) -> Int {
        var thisLoopCount = currentCount
        for subview in subviews {
            if let _ = subview as? UIStepper {
                thisLoopCount = thisLoopCount + 1
            }

                let updatedCount = subview.hasStepper(currentCount: thisLoopCount)
                if (updatedCount != thisLoopCount) {
                    return updatedCount
                }
        }

        return thisLoopCount
    }

    public func findStepper(withTag tag: Int) -> UIStepper? {
        for subview in subviews {
            if let stepper = subview as? UIStepper, stepper.tag == tag {
                return stepper
            }

                if let stepper = subview.findStepper(withTag: tag) {
                    return stepper
                }
        }

        return nil
    }


    public func adjustStepper(withTag tag: Int, byValue value: Int) {
        if let stepper = findStepper(withTag: tag) {
            stepper.value += Double(value)
            stepper.sendActions(for: .valueChanged)
        }
    }
}
