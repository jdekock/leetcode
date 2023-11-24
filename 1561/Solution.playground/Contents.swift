/*
 leetcode: 1561. Maximum Number of Coins You Can Get
 https://leetcode.com/problems/maximum-number-of-coins-you-can-get/?envType=daily-question&envId=2023-11-24
 */

class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        piles.sorted(by: { $0 > $1 }).enumerated().reduce(0) {
            if $1.0 <= ((piles.count / 3)  * 2) - 1, $1.0 % 2 != 0 {
                return $0 + $1.1
            } else {
                return $0
            }
        }
    }
}

// Testcases
Solution().maxCoins([2,4,1,2,7,8]) // return 9
Solution().maxCoins([2,4,5]) // return 4
Solution().maxCoins([9,8,7,6,5,1,2,3,4]) // return 18
