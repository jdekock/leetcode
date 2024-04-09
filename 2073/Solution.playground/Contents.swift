/*
 leetcode: 2073.
 https://leetcode.com/problems/time-needed-to-buy-tickets/
 */

class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var time = 0
        
        for i in 0..<tickets.count {
            if tickets[i] >= tickets[k] {
                time += i <= k ? tickets[k] : (tickets[k] - 1)
            } else {
                time += tickets[i]
            }
        }
   
        return time
    }
}

// Testcases
Solution().timeRequiredToBuy([2,3,2], 2) // return 6
Solution().timeRequiredToBuy([5,1,1,1], 0) // return 8
Solution().timeRequiredToBuy([84,49,5,24,70,77,87,8], 3) // return 154
