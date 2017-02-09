//: Playground - noun: a place where people can play

import UIKit

//https://leetcode.com/problems/3sum/
func threeSum(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    guard nums.count >= 3 else {
        return res
    }
    let arr = nums.sorted()
    for i in stride(from: 0, to: arr.count - 2, by: 1) {
        guard i == 0 || arr[i] != arr[i - 1] else {
            continue
        }
        var left = i + 1, right = arr.count - 1
        while left < right {
            let sum = arr[left] + arr[right] + arr[i]
            if sum == 0 {
                var tmp = [Int]()
                tmp.append(arr[i])
                tmp.append(arr[left])
                tmp.append(arr[right])
                res.append(tmp)
                left += 1
                right -= 1
                while left < right && arr[left] == arr[left - 1] {
                    left += 1
                }
                while left < right && arr[right] == arr[right + 1] {
                    right -= 1
                }
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return res
}
