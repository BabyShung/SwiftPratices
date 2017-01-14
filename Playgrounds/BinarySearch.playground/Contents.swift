//: Playground - noun: a place where people can play

//for arr in [[], [1], [1, 2], [1, 1, 1], [-2, -1, -1, -1, 1, 1]] {
//    print(lastPosition(nums: arr, target: 1))
//}
//
//for i in stride(from: 0, to: 3, by: 2) {
//    print(i)
//}


import UIKit

var str = "Hello, playground"

func lastPosition(nums: [Int], target: Int) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] <= target {
            start = mid
        } else {
            end = mid
        }
    }
    if nums[end] == target {
        return end
    } else if nums[start] == target {
        return start
    } else {
        return -1
    }
}

func sqrt(x: Int) -> Int{
    guard x > 0 else {
        return 0
    }
    let longX = Int64(x)
    var start: Int64 = 1
    var end = longX
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if mid * mid <= longX {
            start = mid
        } else {
            end = mid
        }
    }
    if end * end <= longX {
        return Int(end)
    } else {
        return Int(start)
    }
}

func firstPosition(nums: [Int], target: Int) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] >= target {
            end = mid
        } else {
            start = mid
        }
    }
    if nums[start] == target {
        return start
    } else if nums[end] == target {
        return end
    } else {
        return -1
    }
}
