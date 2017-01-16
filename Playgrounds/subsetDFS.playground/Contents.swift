//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

private func OUTPUT_ADDING_ARR(_ container: [Int], _ pos: Int) {
    print("adding list: \(container), pos: \(pos)")
}

private func OUTPUT_ADDING_ELEMENT(_ container: [Int], _ i: Int, _ nums: [Int]) {
    if nums.count > 0 {
        print("added: num[\(i)]: \(nums[i]), container: \(container), next i: \(i + 1)")
    } else {
        print("added: \(i), container: \(container), next i: \(i + 1)")
    }
}

private func OUTPUT_FUNCTION_RETURN(_ container: [Int], _ i: Int) {
    print("function returned - cur i: \(i), next i: \(i + 1), removedLast: \(container)")
    
}

private func OUTPUT_END_FORLOOP() {
    print("--- for loop done ---")
}

private func OUTPUT_CONTINUE(_ i: Int, _ pos: Int, _ nums: [Int]) {
    print("** continued - i: \(i), pos: \(pos), nums[\(i)] = \(nums[i]) - next i: \(i + 1)")
    //, nums[\(i) - 1] = \(nums[i - 1])
}
/////////////



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
        OUTPUT_ADDING_ELEMENT(container, i, nums)
        dfsHelper(nums, i + 1, &container, &results)
        OUTPUT_FUNCTION_RETURN(container, i)
        container.removeLast()
    }
}

//subsets([1, 2, 3])

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
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
    OUTPUT_ADDING_ARR(container, pos)
    for i in stride(from: pos, to: nums.count, by: 1) {
        guard i == pos || nums[i] != nums[i - 1] else {
            OUTPUT_CONTINUE(i, pos, nums)
            continue
        }
        container.append(nums[i])
        OUTPUT_ADDING_ELEMENT(container, i, nums)
        dfsHelperII(nums, i + 1, &container, &results)
        container.removeLast()
        OUTPUT_FUNCTION_RETURN(container, i)
    }
    OUTPUT_END_FORLOOP()
}

//subsetsWithDup([1, 1, 2, 2])


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
        OUTPUT_ADDING_ARR(container, -1)
    }
    for i in stride(from: 0, to: nums.count, by: 1) {
        guard !container.contains(nums[i]) else {
            OUTPUT_CONTINUE(i, -1, nums)
            continue
        }
        container.append(nums[i])
        OUTPUT_ADDING_ELEMENT(container, i, nums)
        permuteHelper(nums, &res, &container)
        container.removeLast()
        OUTPUT_FUNCTION_RETURN(container, i)
    }
    OUTPUT_END_FORLOOP()

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
        OUTPUT_ADDING_ARR(container, pos)
        return
    }
    for i in stride(from: pos, through: n, by: 1) {
        container.append(i)
        OUTPUT_ADDING_ELEMENT(container, i, [])
        cmnHelper(&res, &container, n, k, i + 1)
        container.removeLast()
        OUTPUT_FUNCTION_RETURN(container, i)
    }
    OUTPUT_END_FORLOOP()
}

combine(20, 1)

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
