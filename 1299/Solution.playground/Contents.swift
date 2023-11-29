/*
 leetcode: 1299. Replace Elements with Greatest Element on Right Side
 https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/description/
 */

class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var result: [Int] = []
        var last = -1
        
        arr.reversed().forEach { number in
            result.insert(last, at: 0)
            if number > last { last = number }
        }
        
        return result
    }
}

// Testcases
Solution().replaceElements([17,18,5,4,6,1]) // return [18,6,6,6,1,-1]
Solution().replaceElements([400]) // return -1
