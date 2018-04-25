/*
Shortest Distance to a Character

Given a string S and a character C, return an array of integers representing the shortest distance from the character C in the string.

Example 1:

Input: S = "loveleetcode", C = 'e'
Output: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
 

Note:

S string length is in [1, 10000].
C is a single character, and guaranteed to be in string S.
All letters in S and C are lowercase.

*/

class Solution {
    func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        var sarr = [Character]()
        var indices = [Int]()
        var result = [Int]()
        var last = 0,start = 0
    
        S.map { sarr.append($0) }
    
        for i in 0..<sarr.count {
            if(sarr[i]==C) {
                indices.append(i)
            }
        }
    
        if let first = indices.first {
            for i in 0...first {
                result.append(first - i)
            }
        }
    
        last = indices[indices.count-1]
        if indices.count >= 2 {
            var prev = indices[0]
            indices.removeFirst()
        
            var next = indices[0]
            indices.removeFirst()
            
            start = prev+1
            for i in start...last {
                //print("i:",i,"prev:",prev,"next:",next,"last:",last)
                if(i<=next) {
                    let dist = min(i-prev,next-i)
                    result.append(dist)
                }
                else {
                    prev = next
                    next = indices[0]
                    indices.removeFirst()
                    let dist = min(i-prev,next-i)
                    result.append(dist)
                }
            }
            

        }
      
        for i in (last+1)..<sarr.count {
            result.append(i-last)
        }

        return result
        
    }
}

