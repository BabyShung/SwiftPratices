//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

private func OUTPUT_ADDING_ARR(_ container: [Int], _ start: Int) {
    print("adding list: \(container), start: \(start)")
}

private func OUTPUT_ADDING_ELEMENT(_ container: [Int], _ i: Int, _ nums: [Int]) {
    if nums.count > 0 {
        print("added: num[\(i)]: \(nums[i]), container: \(container), next i(start): \(i + 1)")
    } else {
        print("added: \(i), container: \(container), next i(start): \(i + 1)")
    }
}

private func OUTPUT_FUNCTION_RETURN(_ container: [Int], _ i: Int) {
    print("function returned - cur i: \(i), next i: \(i + 1), removedLast: \(container)")
    
}

private func OUTPUT_END_FORLOOP() {
    print("--- for loop done ---")
}

private func OUTPUT_CONTINUE(_ i: Int, _ start: Int, _ nums: [Int]) {
    if nums.count > 0 {
        print("**** continued - i: \(i), start: \(start), nums[\(i)] = \(nums[i]), nums[\(i - 1)] = \(nums[i - 1]) - next i: \(i + 1)")
    } else {
        print("**** continued - i: \(i), start: \(start), i = \(i), i - 1 = \(i - 1) - next i: \(i + 1)")
    }
}

private func OUTPUT_I_START(_ i: Int, _ start: Int) {
    print("i: \(i), start: \(start)")
    //, nums[\(i) - 1] = \(nums[i - 1])
}

private func OUTPUT_SUM_RETURN(_ container: [Int], _ target: Int, _ i: Int, _ candidates: [Int]) {
    if candidates.count > 0 {
        print("return - no need to check ascending - container: \(container), target: \(target), candidates[\(i)]: \(candidates[i])")
    } else {
        print("return - no need to check ascending - container: \(container), target: \(target), i: \(i)")
    }
}

private func OUTPUT_SUM_REMOVED_RETURN(_ container: [Int], _ target: Int, _ i: Int, _ candidates: [Int]) {
    if candidates.count > 0 {
        print("function returned - removedLast: \(container), target: \(target), candidates[\(i)]: \(candidates[i])")
    } else {
        print("function returned - removedLast: \(container), target: \(target), i: \(i)")
    }
    
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
                       _ start: Int,
                       _ container: inout [Int],
                       _ results: inout [[Int]]) {
    results.append(container)
    OUTPUT_ADDING_ARR(container, start)
    for i in stride(from: start, to: nums.count, by: 1) {
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
                         _ start: Int,
                         _ container: inout [Int],
                         _ results: inout [[Int]]) {

    results.append(container)
    OUTPUT_ADDING_ARR(container, start)
    for i in stride(from: start, to: nums.count, by: 1) {
        guard i == start || nums[i] != nums[i - 1] else {
            OUTPUT_CONTINUE(i, start, nums)
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
                       _ start: Int) {
    if container.count == k {
        res.append(container)
//        OUTPUT_ADDING_ARR(container, start)
        return
    }
    for i in stride(from: start, through: n, by: 1) {
        container.append(i)
//        OUTPUT_ADDING_ELEMENT(container, i, [])
        cmnHelper(&res, &container, n, k, i + 1)
        container.removeLast()
//        OUTPUT_FUNCTION_RETURN(container, i)
    }
//    OUTPUT_END_FORLOOP()
}

//combine(4, 2)

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
                          _ start: Int) {
    if target == 0 {
        res.append(container)
        OUTPUT_ADDING_ARR(container, start)
    } else {
        for i in stride(from: start, to: candidates.count, by: 1) {
            guard target >= candidates[i] else {//since it's ascending
//                OUTPUT_SUM_RETURN(container, target, i, candidates)
                return
            }
            container.append(candidates[i])
//            OUTPUT_ADDING_ELEMENT(container, i, candidates)
            comDFSHelper(&candidates, target - candidates[i], &res, &container , i)
            container.removeLast()
//            OUTPUT_SUM_REMOVED_RETURN(container, target, i, candidates)

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
                          _ start: Int) {

    if target == 0 {
        res.append(container)
        OUTPUT_ADDING_ARR(container, start)
    } else {
        for i in stride(from: start, to: candidates.count, by: 1) {
            guard target >= candidates[i] else {//since it's ascending
                OUTPUT_SUM_RETURN(container, target, i, candidates)
                return
            }
            
            guard i == start || candidates[i] != candidates[i - 1] else {
//                OUTPUT_CONTINUE(i, start, candidates)
                continue
            }
//            OUTPUT_I_START(i, start)

            container.append(candidates[i])
//            OUTPUT_ADDING_ELEMENT(container, i, candidates)
            comDFSHelper2(&candidates, target - candidates[i], &res, &container , i + 1)
            container.removeLast()
//            OUTPUT_SUM_REMOVED_RETURN(container, target, i, candidates)

        }
    }
}

//[1, 1, 2, 5, 6, 7, 10]
//combinationSum2([1, 1, 1, 5], 8)

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    guard n > 0 && k >= 0 else {
        return []
    }
    var res: [[Int]] = []
    var container: [Int] = []
    combinationSum3Helper(&res, &container, k, n, 1)
    return res
}

private func combinationSum3Helper(_ res: inout [[Int]],
                                   _ container: inout [Int],
                                   _ k: Int,
                                   _ target: Int,
                                   _ start: Int) {
    if target == 0 && container.count == k {
        res.append(container)
        OUTPUT_ADDING_ARR(container, start)
    }
    for i in stride(from: start, through: 9, by: 1) {
        guard target >= i else {
            OUTPUT_CONTINUE(i, start, [])
            OUTPUT_SUM_RETURN(container, target, i, [])
            return //since it's sorted and ascending
        }
        container.append(i)
        OUTPUT_ADDING_ELEMENT(container, i, [])
        combinationSum3Helper(&res, &container, k, target - i, i + 1)
        container.removeLast()
        OUTPUT_SUM_REMOVED_RETURN(container, target, i, [])
    }
}

//combinationSum3(2, 3)

func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var count = 0
    var container: [Int] = []
    combinationSum4Helper(&count, &container, nums.sorted(), target, 0)
    return count
}

private func combinationSum4Helper(_ count: inout Int,
                             _ container: inout [Int],
                             _ nums: [Int],
                             _ target: Int,
                             _ start: Int) {
    if target == 0 {
        count += 1
        print("count: \(count)")
        return
    }
    for i in stride(from: start, to: nums.count, by: 1) {
        guard i == start || nums[i - 1] != nums[i] else {
            OUTPUT_CONTINUE(i, start, nums)
            continue
        }
        guard target >= nums[i] else {
            OUTPUT_SUM_RETURN(container, target, i, nums)
            return
        }
 
        container.append(nums[i])
        OUTPUT_ADDING_ELEMENT(container, i, nums)

        combinationSum4Helper(&count, &container, nums, target - nums[i], i)
        container.removeLast()
        OUTPUT_SUM_REMOVED_RETURN(container, target, i, nums)
    }
}

combinationSum4([1, 2, 3], 4)
