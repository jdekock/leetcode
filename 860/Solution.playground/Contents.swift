/*
 leetcode: 860. Lemonade Change
 https://leetcode.com/problems/lemonade-change/?envType=daily-question&envId=2024-08-15
 */

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var change5 = 0
        var change10 = 0
        var change20 = 0
        
        var canChange = true
        
        for bill in bills {
            if bill == 5 {
                change5 += 1
            }
            
            if bill == 10 {
                change10 += 1
                
                if change5 > 0 {
                    change5 -= 1
                } else {
                    return false
                }
            }
            
            if bill == 20 {
                change20 += 1
                
                if change5 > 0, change10 > 0 {
                    change5 -= 1
                    change10 -= 1
                } else if change5 > 2 {
                    change5 -= 3
                } else {
                    return false
                }
            }
        }

        return true
    }
}

// Testcases
Solution().lemonadeChange([5,5,5,10,20]) // return true
Solution().lemonadeChange([5,5,10,10,20]) // return false
Solution().lemonadeChange([5,5,5,5,10,5,10,10,10,20]) // return true
Solution().lemonadeChange([5,5,5,10,5,5,10,20,20,20]) // return false
