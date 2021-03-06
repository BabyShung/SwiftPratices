//: Playground - noun: a place where people can play

import UIKit

func strStr(_ source: String, _ target: String) -> Int {
    
    let tChars = [Character](target.characters)
    let sChars = [Character](source.characters)
    let tLens = tChars.count
    let sLens = sChars.count
    if tLens == 0 && sLens == 0 {
        return 0
    }
    guard tLens <= sLens else {
        return -1
    }
    
    for i in 0 ... sLens - tLens {
        var j = 0
        while j < tLens {
            if tChars[j] != sChars[i + j] {
                break
            }
            j += 1
        }
        if j == tLens {
            return i
        }
    }
    return -1
}

let index = strStr("aaa", "aaaa")

func strStrDaoZhang(haystack: String, _ needle: String) -> Int {
    var hChars = [Character](haystack.characters)
    var nChars = [Character](needle.characters)
    
    guard hChars.count >= nChars.count else {
        return -1
    }
    if nChars.count == 0 {
        return 0
    }
    
    for i in 0 ... hChars.count - nChars.count {
        guard hChars[i] == nChars[0] else {
            continue
        }
        
        for j in 0 ..< nChars.count {
            guard hChars[i + j] == nChars[j] else {
                break
            }
            if j == nChars.count - 1 {
                return i
            }
        }
    }
    
    return -1
}


//not passed yet
func strStr2(_ source: String, _ target: String) -> Int {

    let tLens = target.characters.count
    let sLens = source.characters.count
    if tLens == 0 && sLens == 0 {
        return 0
    }
    guard tLens <= sLens else {
        return -1
    }
    for i in 0 ... (sLens - tLens) {
        var j = 0
        let tChar = target.characters.index(target.characters.startIndex, offsetBy: j)
        let sChar = source.characters.index(source.characters.startIndex, offsetBy: i + j)
        while j < tLens {
            if tChar != sChar {
                break
            }
            j += 1
        }
        if j == tLens {
            return i
        }
    }
    return -1
}
