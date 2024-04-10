/*
 leetcode: 950. Reveal Cards In Increasing Order
 https://leetcode.com/problems/reveal-cards-in-increasing-order/description/
 */

class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var sortedDeck = deck.sorted()
        var solutionDeck: [Int] = [Int](repeating: 0, count: sortedDeck.count)
        var shouldFill = true
        
        while !sortedDeck.isEmpty {
            let filteredIndices = solutionDeck.indices.filter {solutionDeck[$0] == 0}
            
            filteredIndices.forEach { index in
                if shouldFill {
                    solutionDeck[index] = sortedDeck.removeFirst()
                }
                
                shouldFill = !shouldFill
            }
        }
        
        return solutionDeck
    }
}

// Testcases
Solution().deckRevealedIncreasing([17,13,11,2,3,5,7]) // return [2,13,3,11,5,17,7]
Solution().deckRevealedIncreasing([1,1000]) // return [1,1000]
