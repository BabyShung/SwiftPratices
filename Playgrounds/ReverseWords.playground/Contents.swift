//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Daozhang
func reverseWords(s: String) -> String {
    var chars = [Character](s.characters)
    _reverse(&chars, chars.count - 1, 0)
    
    var start = 0
    for i in 0 ..< chars.count {
        if i == chars.count - 1 || chars[i + 1] == " " {
            _reverse(&chars, start, i)
            start = i + 2
        }
    }
    
    return String(chars)
}

private func _reverse(_ chars: inout [Character], _ start: Int, _ end: Int) {
    var start = start
    var end = end
    
    while start < end {
        _swap(&chars, start, end)
        start += 1
        end -= 1
    }
}

private func _swap(_ chars: inout [Character], _ p: Int, _ q: Int) {
    let temp = chars[p]
    chars[p] = chars[q]
    chars[q] = temp
}
