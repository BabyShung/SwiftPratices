//: Playground - noun: a place where people can play

import UIKit

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 0 else {
        return
    }
    var last = 0
    for i in stride(from: 0, to: nums.count, by: 1) {
        if nums[i] != 0 {
            if (last != i) {
                swap(&nums[i], &nums[last])
            }
            last += 1
        }
    }
}

var arr = [1, 2, 0, 2, 0, 3]
moveZeroes(&arr)
print(arr)