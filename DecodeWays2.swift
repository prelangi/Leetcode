func numDecodings(_ s: String) -> Int {
        guard s.count>0 else { return 0 }
    
        var sarr = Array(s.characters)
        var slen = s.count
        var dp = Array(repeating:0, count: slen+1)
        
        dp[0] = 1
        dp[1] = sarr[0] != "0" ? 1 : 0
    
        if(slen>=2) {
            for i in 2...slen {
                //if current number is "non-zero", we can use it in combination with the remaining string
                if(sarr[i-1] != "0") {
                    dp[i] = dp[i-1]
                }
        
                var last2Ch = Int(String(sarr[i-2]) + String(sarr[i-1]))! //twoDigitNumWithCurrCh 
                if(last2Ch>=10 && last2Ch<=26) {
                    dp[i] += dp[i-2]
                }
            }
        }
    
        return dp[slen]
    }
