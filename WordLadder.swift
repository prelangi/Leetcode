/*
Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:

Only one letter can be changed at a time.
Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
For example,

Given:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log","cog"]
As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.

Note:
Return 0 if there is no such transformation sequence.
All words have the same length.
All words contain only lowercase alphabetic characters.
You may assume no duplicates in the word list.
You may assume beginWord and endWord are non-empty and are not the same.
UPDATE (2017/1/20):
The wordList parameter had been changed to a list of strings (instead of a set of strings). Please reload the code definition to get the latest changes.
*/

class Solution {
    
    class qItem {
        var word: String
        var len: Int
        
        init(_ word: String, _ len: Int) {
            self.word = word
            self.len = len
        }
    }
    
    func getWordsToVisit(_ word: String, _ dict: inout Set<String>,_ letters: [Character]) -> [String] {
        var result = [String]()
        var wordA = [Character]()
        word.map { wordA.append($0)}
        
        dict.remove(word)
        for i in 0..<wordA.count {
            var ch = wordA[i]
            for letter in letters {
                wordA[i] = letter
                var newword = String(wordA)
                if(dict.contains(newword)) {
                    result.append(newword)
                    dict.remove(newword)
                }
            }
            wordA[i]=ch
        }
        return result
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var result = 0
        var wordQ  = [qItem]()
        var dict = Set<String>()
        
        for word in wordList {
            dict.insert(word)
        }
        
        if(dict.count==0) {
            return result
        }
        
        //Swift4: Get letters "a" to "z" in an array
        var aCode = "a".unicodeScalars.first!.value
        let letters: [Character] = (0..<26).map {
            i in Character(UnicodeScalar(aCode + i)!)
        }
        
        var currQItem = qItem(beginWord,1)
        wordQ.append(currQItem)
        
        while(!wordQ.isEmpty) {
            var currItem = wordQ.removeFirst()
            var wordsToVisit = getWordsToVisit(currItem.word,&dict,letters)
            
            for word in wordsToVisit {
                if(word==endWord) {
                    return currItem.len+1
                }
                    
                var newQItem = qItem(word,currItem.len+1)
                wordQ.append(newQItem)
            }
        }
        return result 
    }
}
