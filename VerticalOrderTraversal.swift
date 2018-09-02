// Link to the question: https://leetcode.com/problems/binary-tree-vertical-order-traversal/description/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var posDict = [Int:[Int]]()
        
        guard let root = root else { return result }
        
        var nodeQ:[(node: TreeNode, pos:Int)] = []
        nodeQ.append((root,0))
        
        while(nodeQ.count>0) {
            let (currNode,currPos) = nodeQ.removeFirst()
            var keyExists = posDict[currPos] != nil 
            
            if(keyExists) {
                posDict[currPos]!.append(currNode.val)
            }
            else {
                posDict[currPos] = [currNode.val]
            }
            
            if(currNode.left != nil) {
                nodeQ.append((currNode.left!,currPos-1))
            }
            if(currNode.right != nil) {
                nodeQ.append((currNode.right!,currPos+1))
            }
            
        }
        
        let sortedKeys = Array(posDict.keys).sorted() 
        
        for key in sortedKeys {
            var nodeA = posDict[key]!
            result.append(nodeA)
        }
        
        return result
        
    }
}
