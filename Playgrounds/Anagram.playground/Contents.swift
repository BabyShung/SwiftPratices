//: Playground - noun: a place where people can play

import UIKit

//https://leetcode.com/problems/anagrams/
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String: [String]]()
    var res: [[String]] = []
    for str in strs {
        let arr = [Character](str.characters).sorted()
        let key = String(arr)
        var list = dict[key]
        if list == nil {
            list = []
        }
        list!.append(str)
        dict[key] = list
    }
    
    for key in dict.keys {
        if let cur = dict[key] {
            cur.sorted()
            res.append(cur)
        }
    }
    return res
}