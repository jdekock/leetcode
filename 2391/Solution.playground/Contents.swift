/*
 leetcode: 2391. Minimum Amount of Time to Collect Garbage
 https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage/description/?envType=daily-question&envId=2023-11-20
 */

class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var costs = 0
        let allGarbage = Array(garbage.joined())
        let trucks: [String.Element] = ["G","P","M"]
        
        for truck in trucks {
            costs += allGarbage.filter({ $0 == truck }).count
            
            if let distance = garbage.lastIndex(where: { $0.contains(truck) }) {
                costs += travel[0..<distance].reduce(0, +)
            }
        }
        
        return costs
    }
}

// Testcases
Solution().garbageCollection(["G","P","GP","GG"], [2,4,3]) // 21
Solution().garbageCollection(["MMM","PGM","GP"], [3,10]) // return 37
