/*
 leetcode: 1814. Count Nice Pairs in an Array
 https://leetcode.com/problems/count-nice-pairs-in-an-array/description/?envType=daily-question&envId=2023-11-21
 */

class Solution {
    func countNicePairs(_ nums: [Int]) -> Int {
        var numberMap: [Int: Int] = [:]
        var substracted: [Int] = nums.map {
            return $0 - (Int(String(String($0).reversed())) ?? 0)
        }
        
        substracted.forEach { num in
            numberMap[num, default: 0] += 1
        }

        var pairCount = 0
        for number in numberMap.values {
            pairCount += number * (number - 1) / 2
        }
        
        return pairCount % 1000000007
    }
}

// Testcases
Solution().countNicePairs([42,11,1,97]) // 2
Solution().countNicePairs([13,10,35,24,76]) // return 4
