/*
 leetcode: 815. Bus Routes
 https://leetcode.com/problems/bus-routes/description/?envType=daily-question&envId=2023-11-12
 */

class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        if source == target {
            return 0
        }
        
        let possibleStarts = routes.filter{ $0.contains(source) }
        let possibleEnds = routes.filter{ $0.contains(target) }
        if possibleEnds.isEmpty { return -1 }

        var steps: [Int] = []
        
        var startPoints = possibleStarts.count < possibleEnds.count ? possibleStarts : possibleEnds
        var endStop = possibleStarts.count < possibleEnds.count ? target : source
        
        var mapped: [Int: [Int]] = [:]
        for i in 0..<routes.count {
            routes[i].forEach { stop in
                if mapped[stop] != nil {
                    mapped[stop]?.append(i)
                } else {
                    mapped[stop] = [i]
                }
            }
        }
        
        for bus in startPoints {
            var found = false
            if bus.firstIndex(of: endStop) != nil {
                found = true
                steps.append(1)
                break
            } else {
                var queue: [[Int]] = [[]]
                var visited: Set<[Int]> = Set()
                var stepCount = 0
                
                queue.append(bus)
                visited.insert(bus)
                
                while !queue.isEmpty, found == false {
                    if found { break }
                    if stepCount > steps.sorted().first ?? Int.max {
                        found = true
                        break
                    }
                    
                    let busline = queue.removeFirst()
                    stepCount += 1
                    
                    for busStop in busline {
                        let possibleStops = mapped[busStop] ?? []
                        for stop in possibleStops {
                            let newBus = routes[stop]
                            if newBus.firstIndex(of: endStop) != nil {
                                found = true
                                steps.append(stepCount)
                                break
                            }
                            
                            if !visited.contains(newBus) {
                                visited.insert(newBus)
                                queue.append(newBus)
                            }
                        }
                    }
                }
            }
        }
        
        if steps.count != 0 {
            return steps.sorted().first ?? 0
        } else {
            return -1
        }
    }
}

// Testcases
Solution().numBusesToDestination([[1,2,3],[3,4],[4,5],[5,6],[6,7],[1,7]], 2, 6) // return 3
Solution().numBusesToDestination([[1,2,7],[3,6,7]], 1, 6) // return 2
Solution().numBusesToDestination([[7,12],[4,5,15],[6],[15,19],[9,12,13]], 15, 12) // return -1
