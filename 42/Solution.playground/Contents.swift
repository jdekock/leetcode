/*
 leetcode: 42. Trapping Rain Water
 https://leetcode.com/problems/trapping-rain-water/description/?envType=daily-question&envId=2024-04-12
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        var water = 0
        var highestSeen = 0
        
        for i in 0..<height.count {
            if i > 0 && i < height.count {
                guard let rowAfter = height[i..<height.count].max() else { break }
                
                var lowestWall = min(highestSeen, rowAfter)
                if (lowestWall - height[i]) > 0 {
                    water += lowestWall - height[i]
                }
            }
            
            highestSeen = max(height[i], highestSeen)
        }
        
        return water
    }
}

// Testcases
Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]) // 6
Solution().trap([4,2,0,3,2,5]) // 9
