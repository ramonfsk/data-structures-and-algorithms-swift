import Foundation

/*
 Rotate array to right N times.
 
 For example, given:
 
    A = [3, 8, 9, 7 6]
    K = 3
 
 The function should return [9, 7, 6, 3, 8]. Three rotations are made:
    [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
    [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
    [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 */

func rotateRightOnce(A: [Int]) -> [Int] {
    var swapArray = Array<Int>(repeating: 0, count: A.count)
    
    for i in 0..<A.count - 1 {
        swapArray[i + 1] = A[i]
    }
    
    guard let lastNumber = A.last else { return [] }
    swapArray.insert(lastNumber, at: 0)
    
    return swapArray
}

func solution(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    for _ in 1...K {
        rotateRightOnce(A: result)
    }
    
    return result
}

solution(A: [1, 2, 3, 4, 5], K: 0) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2
