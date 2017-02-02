//: Playground - noun: a place where people can play

import UIKit

//forward pointers

func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var res = Int.max
    var j = 0, sum = 0
    for i in stride(from: 0, to: nums.count, by: 1) {
        while j < nums.count && sum < s {
            sum += nums[j]
            j += 1
        }
        if sum >= s {
            res = min(res, j - i)
        }
        sum -= nums[i]
    }
    if res == Int.max {
        return 0
    }
    return res
}