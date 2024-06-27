import UIKit
import XCTest

/*
 Lowest common ancestor (LCA) in BST.
 https://www.geeksforgeeks.org/lowest-common-ancestor-in-a-binary-search-tree/
 
 O(h) - height of the tree
 
 1. If the value of the current node is less than both n1 and n2, then LCA lies in the right.
 2. If the value of the current node is greater than both n1 and n2, then LCA lies in the left.
 3. If both the above cases are false then return the current node as LCA.
 
                    20
                  /    \
                8        22
              /   \
            4       12
                  /    \
                10      14
 */
class Node {
    var data: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.data = key
    }
}

class BinaryTree {
    var root: Node?
    
    func lca(_ node: Node?, _ n1: Int, _ n2: Int) -> Node? {
        guard let node = node else {
            return nil
        }
        
        if node.data < n1 && node.data < n2 {
            return lca(node.right, n1, n2)
        }
        
        if node.data > n1 && node.data > n2 {
            return lca(node.left, n1, n2)
        }
        
        return node
    }
}

class Tests: XCTestCase {
    var tree: BinaryTree!
    
    override func setUp() {
        tree = BinaryTree()
        tree.root = Node(20)
        tree.root?.left = Node(8)
        tree.root?.right = Node(22)
        tree.root?.left?.left = Node(4)
        tree.root?.left?.right = Node(12)
        tree.root?.left?.right?.left = Node(10)
        tree.root?.left?.right?.right = Node(10)
    }
    
    override  func tearDown() {
        tree = nil
    }
    
    func test1() {
        var n1 = 10
        var n2 = 14
        let lca = tree.lca(tree.root, n1, n2)
        XCTAssertEqual(lca?.data, 12)
    }
    
    func test2() {
        var n1 = 14
        var n2 = 8
        let lca = tree.lca(tree.root, n1, n2)
        XCTAssertEqual(lca?.data, 8)
    }
    
    func test3() {
        var n1 = 10
        var n2 = 22
        let lca = tree.lca(tree.root, n1, n2)
        XCTAssertEqual(lca?.data, 20)
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
