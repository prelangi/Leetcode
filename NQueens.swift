class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var currB = Array(repeating:String(Array(repeating:".",count:n)),count:n)
        var cols = Array(repeating:false,count:n)
        var diagnal = Array(repeating:false,count:2*n-1)
        var antidiagonal = Array(repeating:false,count:2*n-1)
    
        helper(&result,&currB,n,0,&cols,&diagnal,&antidiagonal)
        return result
    }
    
    func helper(_ result: inout [[String]], _ currB: inout [String], _ n: Int, _ row: Int, _ cols: inout [Bool], _ diagonal: inout [Bool], _ antiDiagonal: inout [Bool]) -> Void {
    

        if(row==n) {
            result.append(currB)
            return
        }

        for col in 0..<n {
            if(cols[col] || diagonal[row-col+n-1] || antiDiagonal[row+col]) {
                continue
            }
        
            var curr = currB
            cols[col] = true
            diagonal[row-col+n-1] = true
            antiDiagonal[row+col] = true
            curr[row] = String(curr[row].prefix(col)) + String("Q") + String(curr[row].dropFirst(col + 1))
            
            helper(&result,&curr,n,row+1,&cols,&diagonal,&antiDiagonal)
            
            //Backtrack
            cols[col] = false
            diagonal[row-col+n-1] = false
            antiDiagonal[row+col] = false
            curr[row] = String(curr[row].prefix(col)) + String(".") + String(curr[row].dropFirst(col + 1))
        }
    
        return
    }
}
