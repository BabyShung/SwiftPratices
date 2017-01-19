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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else {
        return res
    }
    var queue = [root]
    
    while !queue.isEmpty {
        var container: [Int] = []
        let size = queue.count
        for _ in stride(from: 0, to: size, by: 1) {
            let cur = queue.removeFirst()
            container.append(cur.val)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res.append(container)
    }
    //res.reverse()
    return res
}

var left2 = TreeNode(9)
var right2 = TreeNode(7)
var left1 = TreeNode(8)
var right1 = TreeNode(6)
var root = TreeNode(5)
root.left = left1
root.right = right1
left1.left = left2
left1.right = right2
levelOrder(root)
