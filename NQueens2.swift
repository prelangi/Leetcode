class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var currB = Array(repeating:String(Array(repeating:".",count:n)),count:n)
        helper(&result,&currB,n,0)
        return result
    }
    
    func canPlace( _ row: Int,  _ col: Int, _ board: [String]) -> Bool {
        var c = -1
        for i in 0..<row {
            for j in 0..<board[0].characters.count {
                if charAt(board[i], j) == "Q" {
                    c = j
                    break
                }
            }
            
            // check col
            if c == col {
                return false
            }
            
            // check diagnol
            if abs(c - col) == abs(i - row) {
                return false
            }
        }
        
        return true
    }
    
    func charAt(_ str: String, _ index: Int) -> Character {
        return str[str.index(str.startIndex, offsetBy: index)]
    }
    
    
    func helper(_ result: inout [[String]], _ currB: inout [String], _ n: Int, _ row: Int) {
    
        if(row>=n) {
            var curr = currB
            result.append(curr)
            return
        }

        for col in 0..<n {
            if(canPlace(row,col,currB)) {
                //print("Placing Q at row:",row,"col:",col)
                currB[row] = String(currB[row].prefix(col)) + String("Q") + String(currB[row].dropFirst(col + 1))
                helper(&result,&currB,n,row+1)                
                //Backtrack
                currB[row] = String(currB[row].prefix(col)) + String(".") + String(currB[row].dropFirst(col + 1))
            }
        }
        return 
    }   
 }
