/*
 leetcode: 1930. Unique Length-3 Palindromic Subsequences
 https://leetcode.com/problems/unique-length-3-palindromic-subsequences/description/?envType=daily-question&envId=2023-11-14
 */

class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let characters = Array(s)
        let filteredCharacters = Set(characters)
        var palindromes: Set<String> = Set()
        
        filteredCharacters.forEach { char in
            if let firstIndex = characters.firstIndex(of: char), let lastIndex = characters.lastIndex(of: char), lastIndex - firstIndex > 1 {
                let uniqueChars = Set(characters[firstIndex+1...lastIndex-1])
                uniqueChars.forEach { uniqueChar in
                    let palindrome = "\(char)\(uniqueChar)\(char)"
                    palindromes.insert(palindrome)
                }
            }
        }
        
        return palindromes.count
    }
}

// Testcases
Solution().countPalindromicSubsequence("aabca") // return 3
Solution().countPalindromicSubsequence("adc") // return 0
Solution().countPalindromicSubsequence("bbcbaba") // return 4
