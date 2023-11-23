/*
 leetcode: 1. Two Sum
 https://leetcode.com/problems/two-sum/
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var currentIndex = 0
        var foundIndex = 0

        for number in nums {
            let toFind = target - number
            if let index = nums.firstIndex(of: toFind), index != currentIndex {
                foundIndex = index
                break
            }
            
            currentIndex += 1
        }

        return [currentIndex,foundIndex]
    }
}

// Testcases
Solution().twoSum([2,7,11,15], 9) // [0,1]
Solution().twoSum([3,2,4], 6) // [1,2]
Solution().twoSum([3,3], 6) // [0,1]
