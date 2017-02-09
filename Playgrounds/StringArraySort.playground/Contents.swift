
import UIKit

let lessThan20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
let tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
let thousands = ["", "Thousand", "Million", "Billion"];

//https://leetcode.com/problems/integer-to-english-words/
func numberToWords(_ num: Int) -> String {
    guard num > 0 else {
        return "Zero"
    }
    var res: String = ""
    var i = 0, num = num
    while num > 0 {
        let threeDigits = num % 1000
        if (threeDigits > 0) {
            res = numberToWordsHelper(threeDigits) + thousands[i] + " " + res
        }
        num = num / 1000
        i += 1
    }
    return res.trimmingCharacters(in: .whitespacesAndNewlines)
}

private func numberToWordsHelper(_ num: Int) -> String {
    if num == 0 {
        return ""
    } else if num < 20 {
        return lessThan20[num] + " "
    } else if num < 100 {
        return tens[num / 10] + " " + numberToWordsHelper(num % 10)
    } else {
        return lessThan20[num / 100] + " Hundred " + numberToWordsHelper(num % 100)
    }
}


func isPalindrome(_ s: String) -> Bool {
    guard s.characters.count > 0 else {
        return true
    }
    
    var start = 0, end = s.characters.count - 1
    let arr = [Character](s.characters), len = arr.count
    while start < end {
        while start < len && !isCharValid(arr[start]) {
            start += 1
        }
        if start == len {
            return true
        }
        while end >= 0 && !isCharValid(arr[end]) {
            end -= 1
        }
        if String(arr[start]).lowercased() == String(arr[end]).lowercased() {
            start += 1
            end -= 1
        } else {
            break
        }
    }
    return end <= start
}

private func isCharValid(_ c: Character) -> Bool {
    return c >= "0" && c <= "9" || c >= "a" && c <= "z" || c >= "A" && c <= "Z"
}
