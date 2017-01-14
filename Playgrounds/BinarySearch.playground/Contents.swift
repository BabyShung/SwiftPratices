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

//what's the brute force way?
//find the shortest & longest wood
//for (int i = sLens; i <= lLens; i++)
//count the wood pieces and compare k
//O(n) + O(L) * O(n)

//use binarySearch
//1. find the longest one - O(n)
//2. on this longest one, do binarySearch (cut half)
//3.In the condition, check if this new length can get >= k pieces - O(n)
//total O(n) + O(log(longestWoodLen)) * O(n)
func woodCut(L: [Int], k: Int) -> Int {
    guard L.count > 0, k > 0 else {
        return 0
    }
    var maxLen: Int = 0
    for cur in L {
        maxLen = max(maxLen, cur)
    }
    var start = 1, end = maxLen
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if countWoodPieces(L, mid) >= k {
            start = mid
        } else {
            end = mid
        }
    }
    if countWoodPieces(L, end) >= k {
        return end
    } else if countWoodPieces(L, start) >= k {
        return start
    } else {
        return 0
    }
}

private func countWoodPieces(_ L: [Int], _ len: Int) -> Int {
    var count = 0
    for cur in L {
        count += cur / len
    }
    return count
}

//LEC 153
func findMin(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var start = 0, end = nums.count - 1
    let target = nums[end]
    while start + 1 < end {
        let mid = start + (end - start) / 2
        if nums[mid] <= target {
            end = mid
        } else {
            start = mid
        }
    }
    if nums[start] > nums[end] {
        return nums[end]
    } else {
        return nums[start]
    }
}

//LEC 162
func findPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var start = 0, end = nums.count - 1
    while (start + 1 < end) {
        let mid = start + (end - start) / 2
        if nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1] {
            return mid
        } else if nums[mid] > nums[mid - 1] {
            start = mid
        } else {
            end = mid
        }
    }
    if nums[start] > nums[end] {
        return start
    } else {
        return end
    }
}



