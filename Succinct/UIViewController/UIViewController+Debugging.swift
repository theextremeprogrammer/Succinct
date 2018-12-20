extension UIViewController {
    func executeWithEnterAndExitDebugLog(closure: () -> UIView?) -> UIView? {
        Succinct.log.debug("<\(String(describing: type(of: self)))>")
        
        if let result = closure() {
            return result
        }
        
        Succinct.log.debug("</\(String(describing: type(of: self)))>")
        return nil
    }
}
