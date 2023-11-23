/*
 leetcode: 1887. Reduction Operations to Make the Array Elements Equal
 https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/description/?envType=daily-question&envId=2023-11-19
 */

class Solution {
    func reductionOperations(_ nums: [Int]) -> Int {
        var mutatedNums = Set(nums).sorted(by: { $0 > $1 })
        var numMap: [Int: Int] = [:]
        var operations = 0
        var i = 1

        for num in nums {
            numMap[num, default: 0] += 1
        }

        for num in mutatedNums {
            operations += mutatedNums[i..<mutatedNums.count].count * (numMap[num] ?? 0)
            i += 1
        }
        
        return operations
    }
}

// Testcases
Solution().reductionOperations([5,1,3]) // 3
Solution().reductionOperations([1,1,1]) // return 0
Solution().reductionOperations([1,1,2,2,3]) // return 4
