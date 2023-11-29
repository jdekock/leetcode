/*
 leetcode: 191. Number of 1 Bits
 https://leetcode.com/problems/number-of-1-bits/description/
 */

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        Array(String(n, radix: 2)).filter({$0 == "1"}).count
        
        /* The easy way */
        // n.nonzeroBitCount
    }
}

// Testcases
Solution().hammingWeight(11) // return 3
Solution().hammingWeight(128) // return 1
Solution().hammingWeight(4294967293) // return 31
