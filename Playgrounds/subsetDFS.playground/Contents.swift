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
    dfsHelper(sortedNums, 0, &container, &results)
    return results
}

private func dfsHelper(_ nums:[Int],
                       _ pos: Int,
                       _ container: inout [Int],
                       _ results: inout [[Int]]) {
    results.append(container)
    print("adding array: \(container), cur pos: \(pos)")
    for i in stride(from: pos, to: nums.count, by: 1) {
        container.append(nums[i])
        print("current: \(container)")
        dfsHelper(nums, i + 1, &container, &results)
        print("function returned - cur i: \(i), next i: \(i + 1)")
        container.removeLast()
    }
}

//subsets([1, 2, 3])

func subsetsII(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return []
    }
    
    let sortedNums = nums.sorted()
    var container: [Int] = []
    var results: [[Int]] = []
    dfsHelperII(sortedNums, 0, &container, &results)
    return results
}

private func dfsHelperII(_ nums:[Int],
                         _ pos: Int,
                         _ container: inout [Int],
                         _ results: inout [[Int]]) {

    results.append(container)
    print("adding array: \(container), cur pos: \(pos)")
    for i in stride(from: pos, to: nums.count, by: 1) {
        guard i == pos || nums[i] != nums[i - 1] else {
            print("skip - i: \(i), index: \(pos), nums[\(i)] = \(nums[i]), nums[\(i) - 1] = \(nums[i - 1])")
            continue
        }
        container.append(nums[i])
        print("current: \(container)")
        dfsHelperII(nums, i + 1, &container, &results)
        print("function returned - cur i: \(i), next i: \(i + 1)")
        container.removeLast()
    }
}

subsetsII([1, 1, 2, 2])


//permutation
func permute(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 0 else {
        return []
    }
    var res: [[Int]] = []
    var container: [Int] = []
    permuteHelper(nums, &res, &container)
    return res
}

private func permuteHelper(_ nums: [Int],
                           _ res: inout [[Int]],
                           _ container: inout [Int]) {
    if container.count == nums.count {
        res.append(container)
//        print("adding array: \(container)")
    }
    for i in stride(from: 0, to: nums.count, by: 1) {
        guard !container.contains(nums[i]) else {
//            print("skip - current: \(container)")
            continue
        }
        container.append(nums[i])
//        print("current: \(container)")
        permuteHelper(nums, &res, &container)
        container.removeLast()
    }
}

//permute([1, 2])

//combination
func combine(_ n: Int, _ k: Int) -> [[Int]] {

    var res: [[Int]] = []
    var container: [Int] = []
    cmnHelper(&res, &container, n, k, 1)
    return res
}

private func cmnHelper(_ res: inout [[Int]],
                       _ container: inout [Int],
                       _ n: Int,
                       _ k: Int,
                       _ pos: Int) {
    if container.count == k {
        res.append(container)
//        print("adding array: \(container)")
        return
    }
    for i in stride(from: pos, through: n, by: 1) {
        container.append(i)
        cmnHelper(&res, &container, n, k, i + 1)
        container.removeLast()
    }
}

//combine(20, 1)

//combination sum
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard candidates.count > 0 else {
        return []
    }
    var sorted = candidates.sorted()
    var container: [Int] = []
    var res: [[Int]] = []
    comDFSHelper(&sorted, target, &res, &container, 0)
    return res
}

private func comDFSHelper(_ candidates: inout [Int],
                          _ target: Int,
                          _ res: inout [[Int]],
                          _ container: inout [Int],
                          _ index: Int) {
    if target == 0 {
        res.append(container)
        print("adding array: \(container)")
    } else {
        for i in stride(from: index, to: candidates.count, by: 1) {
            guard target >= candidates[i] else {//since it's ascending
                print("skip - target: \(target), candidates[\(i)]: \(candidates[i])")
                return
            }
            container.append(candidates[i])
            print("current: \(container), target: \(target), candidates[\(i)]: \(candidates[i])")
            comDFSHelper(&candidates, target - candidates[i], &res, &container , i)
            container.removeLast()
        }
    }
}

//combinationSum([2, 3, 6, 7, 8], 7)


//combination sum II
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard candidates.count > 0 else {
        return []
    }
    var sorted = candidates.sorted()
    var container: [Int] = []
    var res: [[Int]] = []
    comDFSHelper2(&sorted, target, &res, &container, 0)
    return res
}

private func comDFSHelper2(_ candidates: inout [Int],
                          _ target: Int,
                          _ res: inout [[Int]],
                          _ container: inout [Int],
                          _ index: Int) {

    if target == 0 {
        res.append(container)
        print("** adding array: \(container)")
    } else {
        var prev = -1
        for i in stride(from: index, to: candidates.count, by: 1) {
            guard candidates[i] != prev else {
                print("What - prev: \(prev), candidates[\(i)]: \(candidates[i])")

                continue
            }
            guard target >= candidates[i] else {//since it's ascending
                print("skip - target: \(target), candidates[\(i)]: \(candidates[i])")
                return
            }
            container.append(candidates[i])
            print("current: \(container), target: \(target), candidates[\(i)]: \(candidates[i])")
            comDFSHelper2(&candidates, target - candidates[i], &res, &container , i + 1)
            prev = candidates[i]
            container.removeLast()
        }
    }
}

//[1, 1, 2, 5, 6, 7, 10]
//combinationSum2([10, 1, 2, 7, 6, 1, 5], 8)
