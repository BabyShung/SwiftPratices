//: Playground - noun: a place where people can play

import UIKit

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

addDigits(39)