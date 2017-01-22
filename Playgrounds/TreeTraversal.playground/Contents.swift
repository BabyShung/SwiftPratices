//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Stack
 
 Push and pop are O(1) operations.
 */

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

//preorder
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    helper(root, &res)
    return res
}

private func helper(_ cur: TreeNode?, _ res: inout [Int]) {
    guard let cur = cur else {
        return
    }
    res.append(cur.val)
    helper(cur.left, &res)
    helper(cur.right, &res)
}

func preorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    var res: [Int] = []
    var stack = Stack<TreeNode>()
    stack.push(root)
    while !stack.isEmpty {
        let cur = stack.pop()
        if let right = cur?.right {
            stack.push(right)
        }
        if let left = cur?.left {
            stack.push(left)
        }
        res.append(cur!.val);
    }
    return res
}

//inorder
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    helperInorder(root, &res)
    return res
}

private func helperInorder(_ cur: TreeNode?, _ res: inout [Int]) {
    guard let cur = cur else {
        return
    }
    helperInorder(cur.left, &res)
    res.append(cur.val)
    helperInorder(cur.right, &res)
}

//postorder
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    helperPost(root, &res)
    return res
}

private func helperPost(_ cur: TreeNode?, _ res: inout [Int]) {
    guard let cur = cur else {
        return
    }
    helperPost(cur.left, &res)
    helperPost(cur.right, &res)
    res.append(cur.val)
}