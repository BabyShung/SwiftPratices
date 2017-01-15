//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func subsets(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return []
    }
    
    let sortedNums = nums.sorted()
    var current: [Int] = []
    var results: [[Int]] = []
    dfsHelper(nums: sortedNums, index: 0, result: &current, results: &results)
    return results
}

private func dfsHelper(nums:[Int],
                       index: Int,
                       result: inout [Int],
                       results: inout [[Int]]) {
    //[1, 2, 3]
    //[]
    //[1]
    //[1, 2]
    //[1, 2, 3]
    //
    
    results.append(result)
    for i in stride(from: index, to: nums.count, by: 1) {
        result.append(nums[i])
        dfsHelper(nums: nums, index: i + 1, result: &result, results: &results)
        result.removeLast()
    }
}

func subsetsII(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return []
    }
    
    let sortedNums = nums.sorted()
    var current: [Int] = []
    var results: [[Int]] = []
    dfsHelperII(nums: sortedNums, index: 0, result: &current, results: &results)
    return results
}

private func dfsHelperII(nums:[Int],
                       index: Int,
                       result: inout [Int],
                       results: inout [[Int]]) {

    results.append(result)
    for i in stride(from: index, to: nums.count, by: 1) {
        guard i == index || nums[i] != nums[i - 1] else {
            continue
        }
//        if i != index && nums[i] == nums[i - 1] {
//            continue
//        }
        result.append(nums[i])
        dfsHelperII(nums: nums, index: i + 1, result: &result, results: &results)
        result.removeLast()
    }
}