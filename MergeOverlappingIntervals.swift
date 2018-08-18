/*
Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considerred overlapping.
*/

class Solution {
    func sortInterval(_ a:Interval,_ b: Interval) -> Bool {
        return a.start < b.start
    }
    
    func merge(_ intervals: [Interval]) -> [Interval] {
        var intervalsInt = intervals
        
        //sort the intervals by start 
        var sortedIntervals = intervalsInt.sorted(by:sortInterval)
        
        var cnt = intervals.count
        var curr = 0
        
        while(curr < cnt-1) {
            //print(curr,"cnt:",cnt)
            var next = curr + 1
            
            var currInterval = sortedIntervals[curr]
            var nextInterval = sortedIntervals[next]
            
            if(nextInterval.start <= currInterval.end) {
                currInterval.start = min(currInterval.start,nextInterval.start)
                currInterval.end = max(currInterval.end, nextInterval.end)
                
                sortedIntervals.remove(at:next)
                
                //Do not increment curr here since we still need to consider the merged interval for the next merge
            }
            else {
                curr += 1
            }
            
            cnt = sortedIntervals.count

        }
        
        return sortedIntervals
    }
    
    
}
