/*
Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.

Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

Note:
You are not suppose to use the library's sort function for this problem.

click to show follow up.

Link: https://leetcode.com/problems/sort-colors/description/
*/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        if(nums.count==0 || nums.count==1) {
            return 
        }
        
        var start = 0, end = nums.count-1
        var mid = 0
        
        //This pbm is similar to the classic dutch national flag pbm
        //0...start-1 == R
        //start...(mid-1) == W
        //mid...(end) == B
        
        //mid...end is unknown and we need to classify it
        while(mid<=end) {
            if(nums[mid] == 0) {
                (nums[start],nums[mid]) = (nums[mid],nums[start])
                start += 1
                mid += 1
            }
            else if(nums[mid] == 1) {
                mid += 1
            }
            else if(nums[mid] == 2) {
                (nums[mid],nums[end]) = (nums[end],nums[mid])
                end -= 1
            }
            
        }
        
        
    }
    

}
