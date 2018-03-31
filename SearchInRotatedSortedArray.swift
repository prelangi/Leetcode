/*
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.
*/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var result = -1
        guard nums.count>0 else { return result }
        
        var start = 0
        var end = nums.count-1
        
        while(start <= end) {
            var mid = start + (end-start)/2
            //print("start: ",start," end: ", end, " mid: ",mid)
            
            if(nums[mid]==target) {
                return mid
            }
            else if(nums[mid]<=nums[end]) {
                if(target>=nums[mid] && target<=nums[end]) {
                    start = mid+1
                }
                else {
                    end = mid - 1
                }
            }
            else {
                if(target>=nums[start] && target<=nums[mid]) {
                    end = mid-1
                }
                else {
                    start = mid+1
                }
            }
        }
        
        return result 
    }
}
