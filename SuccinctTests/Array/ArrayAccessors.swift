extension Array {
    var second: Element? {
        get {
            if count > 1 {
                return self[1]
            }
            
            return nil
        }
    }
    
    var third: Element? {
        get {
            if count > 2 {
                return self[2]
            }
            
            return nil
        }
    }
    
    var fourth: Element? {
        get {
            if count > 3 {
                return self[3]
            }
            
            return nil
        }
    }
    
    var fifth: Element? {
        get {
            if count > 4 {
                return self[4]
            }
            
            return nil
        }
    }
    
    var sixth: Element? {
        get {
            if count > 5 {
                return self[5]
            }
            
            return nil
        }
    }
}
