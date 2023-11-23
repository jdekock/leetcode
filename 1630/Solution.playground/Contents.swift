/*
 leetcode: 1630. Arithmetic Subarrays
 https://leetcode.com/problems/arithmetic-subarrays/description/?envType=daily-question&envId=2023-11-23
 */

class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var answers: [Bool] = []
        for i in 0..<l.count {
            var sequence = nums[l[i]...r[i]].sorted()
            let differences = zip(sequence, sequence.dropFirst()).map { abs($1 - $0) }
            answers.append(differences.dropFirst().allSatisfy({ $0 == differences.first }))
        }
        
        return answers
    }
}

// Testcases
Solution().checkArithmeticSubarrays([4,6,5,9,3,7], [0,0,2], [2,3,5]) // return [true,false,true]
Solution().checkArithmeticSubarrays([-12,-9,-3,-12,-6,15,20,-25,-20,-15,-10], [0,1,6,4,8,7], [4,4,9,7,9,10]) // return [false,true,false,false,true,true]
