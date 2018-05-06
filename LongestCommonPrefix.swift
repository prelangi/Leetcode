/*
Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note:

All given inputs are in lowercase letters a-z.
*/


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if(strs.count==0) { return ""}
        if(strs.count==1) { return strs[0]}
        var result = ""
        var same = true, prefix = 0
        
        var s0 = Array(strs[0].characters)
        for i in 0..<s0.count {
            
            var ch = s0[prefix]
            for idx in 1..<strs.count {
                var s = Array(strs[idx].characters)
                if(prefix<s.count && s[prefix] == ch) {
                    same = true
                }
                else {
                    same = false
                    break
                }
            }
            
            if(same) {
                result += String(ch)
                prefix += 1
            }
            else {
                return result
            }
        }
        
        return result
    }
}
