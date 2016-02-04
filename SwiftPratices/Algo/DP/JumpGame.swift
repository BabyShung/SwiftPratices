//
//  JumpGame.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 2/3/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

class JumpGame {
    
    func jumpGame(nums: [Int]) -> Bool {
        
        var f:[Bool] = [Bool](count: nums.count, repeatedValue: false)
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
}
