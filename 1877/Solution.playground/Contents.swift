/*
 leetcode: 1877. Minimize Maximum Pair Sum in Array
 https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/description/?envType=daily-question&envId=2023-11-17
 */

class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        var pairs: [Int] = []
        var sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count/2 {
            pairs.append(sortedNums[i] + sortedNums[sortedNums.count - 1 - i])
        }

        return pairs.max() ?? 0
    }
}

// Testcases
Solution().minPairSum([3,5,2,3]) // 7
Solution().minPairSum([3,5,4,2,4,6]) // return 8
Solution().minPairSum([4,1,5,1,2,5,1,5,5,4]) // return 8
