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

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.characters.count > 0 else {
        return 0
    }
    var hash = Set<Character>()
    var j = 0, res = 0
    let arr = [Character](s.characters)
    for i in stride(from: 0, to: arr.count, by: 1) {
        while j < arr.count && !hash.contains(arr[j]) {
            hash.insert(arr[j])
            res = max(res, j - i + 1)
            j += 1
        }
        hash.remove(arr[i])
    }
    return res
}

/*
 Partition
 */

//http://www.lintcode.com/en/problem/kth-largest-element/
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    
}
