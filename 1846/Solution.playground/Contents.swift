/*
 leetcode: 1846. Maximum Element After Decreasing and Rearranging
 https://leetcode.com/problems/maximum-element-after-decreasing-and-rearranging/description/?envType=daily-question&envId=2023-11-15
 */

class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        var sorted = arr.sorted()
        sorted[0] = 1
        var previous = 1
        
        return sorted.enumerated().map {
            previous = $0.element - previous > 1 ? previous + 1 : $0.element
            return previous
        }.last ?? 0
    }
}

// Testcases
Solution().maximumElementAfterDecrementingAndRearranging([2,2,1,2,1]) // 2
Solution().maximumElementAfterDecrementingAndRearranging([1,2,3,4,5]) // 5
Solution().maximumElementAfterDecrementingAndRearranging([100,1,1000]) // 3
Solution().maximumElementAfterDecrementingAndRearranging([91205]) // 1
