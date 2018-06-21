/*
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums2 = nums
        nums2.sort()  
        var uniqueResults = Set<String>()
        var result = [[Int]]()

        for i in 0..<nums2.count {
            var num1 = nums2[i]
            var left = i+1
            var right = nums2.count-1
        
            while(left < right) {
                var tempSum = num1 + nums2[left] + nums2[right]
                if(tempSum==0) {
                    var sol = [Int]()
                    sol.append(num1)
                    sol.append(nums2[left])
                    sol.append(nums2[right])
                    
                    //To append only unique results
                    var tempR = String(num1) + String("_") + String(nums2[left]) + String("_") + String(nums2[right])
                    if(!uniqueResults.contains(tempR)) {
                        uniqueResults.insert(tempR)
                        result.append(sol)
                    }
                    left += 1
                    right -= 1
                }
                else if(tempSum>0) {
                    right -= 1
                }
                else {
                    left += 1
                }
            }
        }

        return result
        
        
    }
}
