//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func subsets(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return []
    }
    
    let sortedNums = nums.sorted()
    var container: [Int] = []
    var results: [[Int]] = []
    dfsHelper(nums: sortedNums, index: 0, container: &container, results: &results)
    return results
}

private func dfsHelper(nums:[Int],
                       index: Int,
                       container: inout [Int],
                       results: inout [[Int]]) {
    //[1, 2, 3]
    //[]
    //[1]
    //[1, 2]
    //[1, 2, 3]
    //
    
    results.append(container)
    for i in stride(from: index, to: nums.count, by: 1) {
        container.append(nums[i])
        dfsHelper(nums: nums, index: i + 1, container: &container, results: &results)
        container.removeLast()
    }
}

func subsetsII(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return []
    }
    
    let sortedNums = nums.sorted()
    var container: [Int] = []
    var results: [[Int]] = []
    dfsHelperII(nums: sortedNums, index: 0, container: &container, results: &results)
    return results
}

private func dfsHelperII(nums:[Int],
                       index: Int,
                       container: inout [Int],
                       results: inout [[Int]]) {

    results.append(container)
    for i in stride(from: index, to: nums.count, by: 1) {
        guard i == index || nums[i] != nums[i - 1] else {
            continue
        }
//        if i != index && nums[i] == nums[i - 1] {
//            continue
//        }
        container.append(nums[i])
        dfsHelperII(nums: nums, index: i + 1, container: &container, results: &results)
        container.removeLast()
    }
}

//combination sum
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard candidates.count > 0 else {
        return []
    }
    var sorted = candidates.sorted()
    var container: [Int] = []
    var res: [[Int]] = []
    comDFSHelper(&sorted, target, res: &res, container: &container, index: 0)
    return res
}

private func comDFSHelper(_ candidates: inout [Int], _ target: Int, res: inout [[Int]], container: inout [Int], index: Int) {
    guard target >= 0 else {
        return
    }
    if target == 0 {
        res.append(container)
    } else {
        for i in stride(from: index, to: candidates.count, by: 1) {
            container.append(candidates[i])
            comDFSHelper(&candidates, target - candidates[i], res: &res, container: &container , index: i)
            container.removeLast()
        }
    }
}
