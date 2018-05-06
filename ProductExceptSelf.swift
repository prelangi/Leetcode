/*
Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Solve it without division and in O(n).

For example, given [1,2,3,4], return [24,12,8,6].

Follow up:
Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
*/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        if(nums.count==0 || nums.count==1) {
            return result
        }
        
        var len = nums.count
        var suffix = Array(repeating:1,count:len)
        var prefix = Array(repeating:1,count:len)
        
        //1,2,3,4 ==> 1,1,2,6
        for i in 1..<len {
            prefix[i] = prefix[i-1]*nums[i-1]
        }
        
        for i in stride(from:len-2,through:0,by:-1) {
            suffix[i] = suffix[i+1]*nums[i+1]
        }
        
        for i in 0..<len {
            result.append(prefix[i] * suffix[i])
        }
        
        return result
    }
}
