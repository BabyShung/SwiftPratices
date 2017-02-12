//: Playground - noun: a place where people can play

import UIKit

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


func isValid(_ s: String) -> Bool {
    var stack = Stack<Character>()
    let arr = [Character](s.characters)
    for cur in arr {
        if "({[".contains(String(cur)) {
            stack.push(cur)
        } else {
            if !stack.isEmpty && isPair(stack.top!, cur) {
                stack.pop()
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}

private func isPair(_ a: Character, _ b: Character) -> Bool {
    return a == "(" && b == ")" || a == "[" && b == "]" || a == "{" && b == "}"
}
