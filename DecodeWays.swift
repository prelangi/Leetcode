func numDecodings(_ s: String) -> Int {
        
        var len = s.count
        var result = 0
        var curr = 0
    
        if (len==0 || s[s.startIndex]=="0") {
            return 0
        }
    
        if(len==1) {
            return 1
        }
    
        var pre1 = 1, pre2 = 1
        for i in 2...len {
            let idx_i_minus_1 = s.index(s.startIndex,offsetBy: i-1)
            let idx_i_minus_2 = s.index(s.startIndex,offsetBy: i-2)
            var lastCh  = Int(String(s[idx_i_minus_1]))!
            var last2Ch = Int(String(s[idx_i_minus_2...idx_i_minus_1]))!
            curr = 0
        
            if(lastCh>=1 && lastCh<=9) {
                curr += pre1
            }
        
            if(last2Ch>=10 && last2Ch<=26) {
                curr += pre2
            }
        
            pre2 = pre1
            pre1 = curr
        
        }
    
        return curr
        
    }
