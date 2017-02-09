//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//http://www.lintcode.com/en/problem/add-digits/
func addDigits(_ num: Int) -> Int {
    var num = num
    while num / 10 != 0 {//while num is not a single digit
        var sum = 0
        while num > 0 {
            sum += num % 10
            num /= 10
        }
        num = sum
    }
    return num
    
    //O(1)
    //return (num - 1) % 9 + 1;

    //Bad
//    guard num != 0 else {
//        return 0
//    }
//    var res = 0, num = num
//    while num != 0 {
//        let digit = num % 10
//        res = (res * 10 + digit) % 9
//        num /= 10
//        print("res: \(res), digit: \(digit),  xx: \((res * 10 + digit)), num: \(num)")
//    }
//    return res == 0 ? 9 : res
}

//addDigits(39)

private func addStringsHelper(num1: String, num2: String, mod: Int) -> String {
    let num1Arr = [Character](num1.characters)
    let num2Arr = [Character](num2.characters)
    var i = num1Arr.count, j = num2Arr.count
    var carry = 0, res = ""
    while i >= 0 || j >= 0 {
        if i >= 0 {
            carry += Int(String(num1Arr[i]))!
            i -= 1
        }
        if j >= 0 {
            carry += Int(String(num2Arr[j]))!
            j -= 1
        }
        res = String(carry % mod) + res
        carry /= mod
    }
    return carry > 0 ? "1" + res : res
}
