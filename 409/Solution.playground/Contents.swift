/*
 leetcode: 409. Longest Palindrome
 https://leetcode.com/problems/longest-palindrome/description/
 */

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        
        s.forEach { character in
            map[character, default: 0] += 1
        }
        
        var palindromeCount = 0
        var countedSingle = false
        
        map.forEach { charcter, count in
            if count == 1, countedSingle {
                return
            }
            
            palindromeCount += count
            
            if count == 1 {
                countedSingle = true
            } else if count % 2 != 0, countedSingle == false {
                countedSingle = true
            } else if count > 1, count % 2 != 0 {
                palindromeCount -= 1
            }
        }
        
        return palindromeCount
    }
}

// Testcases
Solution().longestPalindrome("abccccdd") // 7
Solution().longestPalindrome("a") // 1
Solution().longestPalindrome("bananas") // 5
