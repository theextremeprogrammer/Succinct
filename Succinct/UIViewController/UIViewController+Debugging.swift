extension UIViewController {
    internal func executeWithEnterAndExitDebugLog(closure: () -> UIView?) -> UIView? {
        let objectType = String(describing: type(of: self))
        
        Succinct.log.debug("<\(objectType)>")
        
        if let result = closure() {
            return result
        }
        
        Succinct.log.debug("</\(objectType)>")
        
        return nil
    }
}
