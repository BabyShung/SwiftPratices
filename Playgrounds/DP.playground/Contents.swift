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
func numDecodings(_ s: String) -> Int {
    let len = s.characters.count
    guard len > 0 else {
        return 0
    }
    
    var dp = Array(repeating: 0, count: len + 1)
    dp[0] = 1
    dp[1] = isValid(s.substring(with: 0 ..< 1)) ? 1 : 0
    print("Initial: \(dp)")
    for i in stride(from: 2, through: len, by: 1) {
        if isValid(s.substring(with: i - 1 ..< i)) {
            dp[i] += dp[i - 1]
            print("one digit: \(dp) - cur index: \(i)")
        }
        if isValid(s.substring(with: i - 2 ..< i)) {
            dp[i] += dp[i - 2]
            print("two digit: \(dp) - cur index: \(i)")
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

print(numDecodings("170"))
//print("Int max: \(Int.max)")
//print(numDecodings("6065812287883668764831544958683283296479682877898293612168136334983851946827579555449329483852397155"))
