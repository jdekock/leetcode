/*
 leetcode: 1424. Diagonal Traverse II
 https://leetcode.com/problems/diagonal-traverse-ii/?envType=daily-question&envId=2023-11-22
 */

class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var numberMap: [Int: [Int]] = [:]
        
        for i in 0..<nums.count {
            for j in 0..<nums[i].count {
                numberMap[i+j, default: []].insert(nums[i][j], at: 0)
            }
        }
        
        let sortedMap = Array(numberMap.keys).sorted()
        
        var result: [Int] = []
        sortedMap.forEach({
            result.append(contentsOf: numberMap[$0] ?? [])
        })
        
        return result
    }
}

// Testcases
Solution().findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]]) // [1,4,2,7,5,3,8,6,9]
Solution().findDiagonalOrder([[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]) // return [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
