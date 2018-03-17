/*
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

For example, 
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.

*/

class Solution {
    func trap(_ height: [Int]) -> Int {
        
        //Base scenario: Empty array
        if(height.count==0) {
            return 0
        }
        
        var left = 0, right = height.count-1
        var maxLeft = height[0]
        var maxRight = height[right]
        var waterTrapped = 0
        
        while(left < right) {
            
            //Right wall is taller and will hold water, so we can collect water on left
            if(height[left] <= height[right]) {
                if(height[left] >= maxLeft) {
                    maxLeft = height[left]
                }
                else {
                    waterTrapped += maxLeft - height[left]
                }
                left += 1
            }
            else {
                if(height[right] >= maxRight) {
                    maxRight = height[right]
                }
                else {
                    waterTrapped += maxRight - height[right]
                }
                right -= 1
                
            }
            
            
        }
        
        return waterTrapped
        
    }
}
