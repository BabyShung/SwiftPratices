//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

//https://leetcode.com/problems/decode-ways/
func numDecodings2(_ s: String) -> Int {
    let len = s.characters.count
    guard len > 0 else {
        return 0
    }
    
    var dp = Array(repeating: 0, count: len + 1)
    dp[0] = 1
    dp[1] = isValid(s.substring(with: 0 ..< 1)) ? 1 : 0
    for i in stride(from: 2, through: len, by: 1) {
        if isValid(s.substring(with: i - 1 ..< i)) {
            dp[i] += dp[i - 1]
        }
        if isValid(s.substring(with: i - 2 ..< i)) {
            dp[i] += dp[i - 2]
        }
    }
    return dp[len]
}

private func isValid(_ str: String) -> Bool {
    guard let code = Int(str) else {
        return false
    }
    return code != 0 || (code >= 1 && code <= 26)
}

func numDecodings(_ s: String) -> Int {
    let arr = [Character](s.characters)
    let len = arr.count
    guard len > 0 else {
        return 0
    }
    var count = Array(repeating: 0, count: len + 1)
    count[0] = 1
    count[1] = arr[0] != "0" ? 1 : 0
    for i in stride(from: 2, through: len, by: 1) {
        if arr[i - 1] != "0" {
            count[i] = count[i - 1]
        }
        if isTwoDigits(arr[i - 2], arr[i - 1]) {
            count[i] += count[i - 2]
        }
    }
    return count[len]
}

private func isTwoDigits(_ a: Character, _ b: Character) -> Bool {
    return a == "1" || a == "2" && b <= "6"
}

//print(numDecodings("170"))
//print("Int max: \(Int.max)")
//print(numDecodings("6065812287883668764831544958683283296479682877898293612168136334983851946827579555449329483852397155"))

//HR
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var sum = Array(repeating: 0, count: nums.count + 1)
    sum[1] = nums[0]
    for i in stride(from: 2, through: nums.count, by: 1) {
        sum[i] = max(sum[i - 1], sum[i - 2] + nums[i - 1])
    }
    return sum[nums.count]
}


