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

func isBalanced(_ root: TreeNode?) -> Bool {
    return isBalancedHelper(root).0
}

func isBalancedHelper(_ root: TreeNode?) -> (Bool, Int) {
    guard let root = root else {
        return (true, 0)
    }
    
    let leftTuple = isBalancedHelper(root.left)
    let rightTuple = isBalancedHelper(root.right)
    
    if !leftTuple.0 || !rightTuple.0 {
        return (false, -1)
    } else if abs(leftTuple.1 - rightTuple.1) > 1 {
        return (false, -1)
    } else {
        return (true, 1 + max(leftTuple.1, rightTuple.1))
    }
}

//114. Flatten Binary Tree to Linked List QuestionEditorial Solution
func flatten(_ root: TreeNode?) {
    flattenHelper(root)
}

func flattenHelper (_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    let leftLast = flattenHelper(root.left)
    let rightLast = flattenHelper(root.right)
    
    if leftLast != nil {
        leftLast!.right = root.right
        root.right = root.left
        root.left = nil
    }
    
    if rightLast != nil {
        return rightLast
    }
    
    if leftLast != nil {
        return leftLast
    }
    
    return root
}

