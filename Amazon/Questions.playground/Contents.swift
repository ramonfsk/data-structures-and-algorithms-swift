import Foundation
import XCTest

/*
   _
  /_\  _ __  __ _ ______ _ _
 / _ \| '  \/ _` |_ / _ \ ' \
/_/ \_\_|_|_\__,_/__\___/_||_|

 Write an algorithm that merges these two arrays into one.
 
 */

func merge(_ A: [Int], _ B: [Int]) -> [Int] {
    var result = [Int]()
    var i = 0, j = 0
    
    while i < A.count && j < B.count {
        if A[i] <= B[j] {
            result.append(A[i])
            i += 1
        } else if B[j] <= A[i] {
            result.append(B[j])
            j += 1
        }
    }
    
    result.append(contentsOf: A[i..<A.count])
    result.append(contentsOf: B[j..<B.count])
    
    return result
}

merge([1, 3, 5, 7], [2, 5, 8, 11, 14]) // [1, 2, 3, 5, 5, 7, 8, 11, 14]

class Tests: XCTestCase {
    func testMerge() {
        let expected = [1, 2, 3, 5, 5, 7, 8, 11, 14]
        let actual = merge([1, 3, 5, 7], [2, 5, 8, 11, 14])
        XCTAssertEqual(expected, actual)
    }
 
    func testL1Empty() {
        let expected = [2, 5, 8, 11, 14]
        let actual = merge([], [2, 5, 8, 11, 14])
        XCTAssertEqual(expected, actual)
    }
    
    func testL2Empty() {
        let expected = [1, 3, 5, 7]
        let actual = merge([1, 3, 5, 7], [])
        XCTAssertEqual(expected, actual)
    }

    func testNoOverlap() {
        let expected = [1, 2, 3, 4, 5, 6]
        let actual = merge([1, 2, 3], [4, 5, 6])
        XCTAssertEqual(expected, actual)
    }
}

// Infrastructure
class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
Tests.defaultTestSuite.run()
