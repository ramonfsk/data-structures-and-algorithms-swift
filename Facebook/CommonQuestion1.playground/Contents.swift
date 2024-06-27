import Foundation

/*
 ___            _              _
| __|_ _ __ ___| |__  ___  ___| |__
| _/ _` / _/ -_) '_ \/ _ \/ _ \ / /
|_|\__,_\__\___|_.__/\___/\___/_\_\

 Determine which elements intersect between two given arrays.
 
 */

func intersectBrute(_ A: [Int], _ B: [Int]) -> [Int] {
    var result = [Int]()
    
    for a in A {
        for b in B {
            if a == b {
                result.append(a)
            }
        }
    }
    
    return result
}

intersectBrute([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]


func intersect(_ A: [Int], _ B: [Int]) -> [Int] {
    // create two pointers and loop through both arrays
    // if one element is less than other...
    // increment the lower pointer
    // if elements are equal collect
    // then increment of the pointers
    // don't forget, the arrays must be sorted!
    let firstSortedArray = A.sorted()
    let secondSortedArray = B.sorted()
    var result = [Int]()
    
    var i = 0
    var j = 0
    
    // O(n + m)
    while i < firstSortedArray.count && j < secondSortedArray.count {
        if firstSortedArray[i] < secondSortedArray[j] {
            i += 1
        } else if secondSortedArray[j] < firstSortedArray[i] {
            j += 1
        } else {
            result.append(firstSortedArray[i])
            i += 1
        }
    }
    
    return result
}

intersect([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]
