//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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

