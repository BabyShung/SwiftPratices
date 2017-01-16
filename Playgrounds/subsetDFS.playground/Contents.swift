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
    results.append(container)
    //print("adding array: \(container)")
    for i in stride(from: index, to: nums.count, by: 1) {
        container.append(nums[i])
        //print("current: \(container)")
        dfsHelper(nums: nums, index: i + 1, container: &container, results: &results)
        container.removeLast()
    }
}

subsets([1, 2, 3])

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
    print("adding array: \(container)")
    for i in stride(from: index, to: nums.count, by: 1) {
        guard i == index || nums[i] != nums[i - 1] else {
            print("skip - i: \(i), index: \(index), nums[\(i)] = \(nums[i]), nums[\(i) - 1] = \(nums[i - 1])")
            continue
        }
//        if i != index && nums[i] == nums[i - 1] {
//            continue
//        }
        container.append(nums[i])
        print("current: \(container)")
        dfsHelperII(nums: nums, index: i + 1, container: &container, results: &results)
        container.removeLast()
    }
}

subsetsII([1, 1, 2, 2])

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
        //print("adding array: \(container)")
    } else {
        for i in stride(from: index, to: candidates.count, by: 1) {
            container.append(candidates[i])
            //print("current: \(container)")
            comDFSHelper(&candidates, target - candidates[i], res: &res, container: &container , index: i)
            container.removeLast()
        }
    }
}

combinationSum([2, 3, 6, 7], 7)