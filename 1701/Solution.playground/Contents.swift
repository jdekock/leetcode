/*
 leetcode: 1701. Average Waiting Time
 https://leetcode.com/problems/average-waiting-time/description/
 */

class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var currentTime = 0
        var waitingTime = 0
        
        for customer in customers {
            if currentTime < customer[0] {
                waitingTime += customer[1]
                currentTime = customer[0] + customer[1]
            } else {
                var extraTime = (currentTime - customer[0]) + customer[1]
                waitingTime += extraTime
                currentTime += customer[1]
            }
        }
        
        return Double(waitingTime) / Double(customers.count)
    }
}

// Testcases
Solution().averageWaitingTime([[1,2],[2,5],[4,3]]) // 5
Solution().averageWaitingTime([[5,2],[5,4],[10,3],[20,1]]) // return 3.25
