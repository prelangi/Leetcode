class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var currR = [Int]()
        
        //1. To avoid using the same number again, we sort the array 
        //and do not run through the combination when it is equal to prev value
        combinationSum2Wrapper(candidates.sorted(), target, 0, &currR, &result)
        
        return result
    }
    
    func combinationSum2Wrapper(_ candidates:[Int], _ target: Int, _ startIndex: Int, _ currR: inout [Int], _ result: inout [[Int]]) {
            
            //Base condition
            if(0==target) {
                result.append(currR)
                return
            }
        
            //Array is sorted; so we will not find a smaller number
            if(startIndex<candidates.count && candidates[startIndex] > target) {
                return
            }
            
            var prevNum = Int.min
        
            for index in startIndex..<candidates.count {
                var num = candidates[index]
                if(num != prevNum && num <= target) { //Don't need to consider values that are higher than the currTarget
                    
                    currR.append(num)
                    //Set index+1 to avoid same combinations
                    combinationSum2Wrapper(candidates, target-num, index+1, &currR, &result)
                    currR.removeLast()
                }
                //Set previous num to avoid using the same num again
                prevNum = num
            }
        
            return
    }
}
