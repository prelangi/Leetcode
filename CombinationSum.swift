class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var currRes = [Int]()
        var result = [[Int]]()
        
        combinationSumWrapper(candidates,target,0, &currRes,&result)
        return result
    }
    
    func combinationSumWrapper(_ candidates: [Int], _ target: Int,_ startIdx: Int, _ currRes: inout [Int], _ result: inout [[Int]]) {
        
        var currSum = currRes.reduce(0,+)
        if(currSum==target) {
            result.append(currRes)
            return 
        }
        
        var currTarget = target - currSum 
        
        for idx in startIdx..<candidates.count { 
            var num = candidates[idx]
            if(num <= currTarget) {
                currRes.append(num)
                combinationSumWrapper(candidates,target, idx, &currRes,&result)
                currRes.removeLast()
            }
        }
        
        return 
    }
}
