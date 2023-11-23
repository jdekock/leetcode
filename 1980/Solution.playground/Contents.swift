/*
 leetcode: 1980. Find Unique Binary String
 https://leetcode.com/problems/find-unique-binary-string/?envType=daily-question&envId=2023-11-16
 */

class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        return nums.enumerated()
                    .map { Array($0.1)[$0.0] == "1" ? "0" : "1"}
                    .joined()
    }
}

// Testcases
Solution().findDifferentBinaryString(["01","10"]) // return 11
Solution().findDifferentBinaryString(["00","01"]) // return 11
Solution().findDifferentBinaryString(["111","011","001"]) // return 101
