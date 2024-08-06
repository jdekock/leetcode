/*
 leetcode: 3016. Minimum Number of Pushes to Type Word II
 https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii/description/
 */

class Solution {
    func minimumPushes(_ word: String) -> Int {
        var count = 0
        var total = 0
        let grouped = word.split(separator: "")
                          .reduce(into: [:]) { result, character in
                              result[character, default: 0] += 1
                          }
                          .sorted { $0.1 > $1.1 }.forEach { _, value in
                              total += (value * ((count / 8) + 1))
                              count += 1
                          }
        
        return total
    }
}

// Testcases
Solution().minimumPushes("abcde") // 5
Solution().minimumPushes("xyzxyzxyzxyz") // 12
Solution().minimumPushes("aabbccddeeffgghhiiiiii") // 24
Solution().minimumPushes("alporfmdqsbhncwyu") // 27
Solution().minimumPushes("aremgjnptohswfdkyuzvicqxb") // 52
