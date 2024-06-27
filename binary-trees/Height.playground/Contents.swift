import Foundation
import XCTest

/*
 TreeHeight
 https://app.codility.com/programmers/trainings/4/tree_height/
 
 Height is the number of steps to the lowest leaf.
 Length of the longest path.
 Tree with one node has height of zero.
   
                    20
                  /    \
                8        22
              /   \
            4       12
                  /    \
                10      14
 */

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
    
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
}

class Tree {
    var x: Int = 0
    var l: Tree?
    var r: Tree?
    
    init(_ key: Int) {
        self.x = key
    }
}

func solution(_ T: Tree?) -> Int {
    return height(T!)
}

func isLeaf(_ tree: Tree?) -> Bool {
    return tree?.l == nil && tree?.r == nil
}

func height(_ tree: Tree?) -> Int {
    if isLeaf(tree) {
        return 0
    } else {
        return 1 + max(height(tree?.l ?? nil), height(tree?.r ?? nil))
    }
}

class Tests: XCTestCase {
    func testHeightOfZero() {
        let root = Node(5)
        XCTAssertEqual(root.height(), 0)
    }
    
    func testHeightOfTwo() {
        let root = Node(5)
        root.left = Node(3)
        root.right = Node(10)
        root.left?.left = Node(20)
        root.left?.right = Node(21)
        root.right?.left = Node(1)
        
        XCTAssertEqual(root.height(), 2)
    }
    
    func testHeightOfThree() {
        let tree = Tree(20)
        tree.l = Tree(8)
        tree.r = Tree(22)
        tree.l?.l = Tree(4)
        tree.l?.r = Tree(12)
        tree.l?.r?.l = Tree(10)
        tree.l?.r?.l = Tree(14)
    
        XCTAssertEqual(solution(tree), 3)
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
