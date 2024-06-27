import Foundation

/*
 ___                _
/ __|___  ___  __ _| |___
|(_ / _ \/ _ \/ _` | / -_)
\___\___/\___/\__, |_\___|
              |___/
 
 Given a set of numbers, determine if there is a pair that equals a given sum.
 
 */

func hasPairWithSumBrute(_ arr: [Int], _ sum: Int) -> Bool {
    // progressive walk - o(n^2)
    for i in 0..<arr.count {
        for j in i + 1..<arr.count {
            if arr[i] + arr[j] == sum {
                return true
            }
        }
    }
    
    return false
}

hasPairWithSumBrute([1, 2, 4, 9], 8) // false
hasPairWithSumBrute([1, 2, 4, 4], 8) // true

func hasPairWithSum(_ arr: [Int], _ sum: Int) -> Bool {
    // store the complement in a Set
    var comp = Set<Int>()
    
    for value in arr {
        print("Have we seen \(value)'s complement \(sum - value) before?")
        if comp.contains(value) {
            print("Yes we have - match ✅.")
            return true
        }
        
        print("No we have not. Add it.")
        comp.insert(sum - value)
    }
    
    return false
}
    
hasPairWithSum([1, 2, 4, 9], 8)     // false
hasPairWithSum([1, 2, 4, 4], 8)     // true
