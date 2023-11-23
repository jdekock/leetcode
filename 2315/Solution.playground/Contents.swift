/*
 leetcode: 2315. Count Asterisks
 https://leetcode.com/problems/count-asterisks/description/
 */

class Solution {
    func countAsterisks(_ s: String) -> Int {
        if !s.contains("*") { return 0 }

        return s.split(separator: "|", omittingEmptySubsequences: false)
                .enumerated()
                .filter { $0.0 % 2 == 0 }
                .map { $0.1 }
                .joined()
                .map { String($0) }
                .filter({ $0 == "*" })
                .count
    }
}

// Testcases
Solution().countAsterisks("l|*e*et|c**o|*de|") // 2
Solution().countAsterisks("iamprogrammer") // 0
Solution().countAsterisks("yo|uar|e**|b|e***au|tifu|l") // 5
Solution().countAsterisks("*||*|||||*|*|***||*||***|") // 3
