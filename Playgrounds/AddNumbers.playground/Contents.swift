//: Playground - noun: a place where people can play

import UIKit

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


//http://www.lintcode.com/en/problem/add-digits/
//123
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
}

//addDigits(39)

func addStringsShared(_ num1: String, _ num2: String, _ mod: Int) -> String {
    
    let arr1 = [Character](num1.characters)
    let arr2 = [Character](num2.characters)
    var len1 = arr1.count - 1, len2 = arr2.count - 1
    
    var carry = 0
    var res = ""
    while len1 >= 0 || len2 >= 0 {
        if len1 >= 0 {
//            carry += arr1[len1]
            len1 -= 1
        }
        if len2 >= 0 {
//            carry += Int(arr2[len2])!
            len2 -= 1
        }
        
        res = String(carry % mod) + res
        carry /= mod
    }
    return carry > 0 ? "1" + res : res
}

//http://www.lintcode.com/en/problem/add-two-numbers/
//func addTwoNumbers(_ n1: ListNode?, _ n2: ListNode?) -> ListNode {
// 
//    var carry = 0
//    let dummy = ListNode(-1)
//    var cur: ListNode? = dummy
//    while n1 != nil || n2 != nil {
//        if n1 != nil {
//            carry += n1!.val
//            n1 = n1!.next
//        }
//        if n2 != nil {
//            carry += n2.val
//            n2 = n2.next
//        }
//        cur?.next = ListNode(carry % 10)
//        cur = cur?.next
//        carry /= 10
//    }
//    if carry > 0 {
//        cur?.next = ListNode(carry)
//    }
//    return dummy.next!
//}

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
