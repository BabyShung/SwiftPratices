//
//  JumpGame.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 2/3/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

class JumpGame {
    
    func jumpGame(_ nums: [Int]) -> Bool {
        
        var f:[Bool] = [Bool](repeating: false, count: nums.count)
        f[0] = true
        
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if (f[j] == true && j + nums[j] >= i) {
                    f[i] = true
                    break
                }
            }
        }
        return f[nums.count - 1]
    }
    
    func jumpGameII(_ nums: [Int]) -> Int {
        //state: f[i] means the minimum steps jump from index 0 to i
        //function: f[i] = Min(f[j] + 1), where j < i && j can jump to i
        //init: f[0] = 0
        //result: f[i]
        
        var f:[Int] = [Int](repeating: Int.max, count: nums.count)
        f[0] = 0
        
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if (f[j] != Int.max && j + nums[j] >= i) {
                    f[i] = f[j] + 1
                    break
                }
            }
        }
        return f[nums.count - 1]
    }
}
