//
//  JumpGameTests.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 2/3/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import XCTest
@testable import SwiftPratices

class JumpGameTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJumpGame() {
        var nums = [2, 3, 0, 0, 9]
        let instance = JumpGame()
        XCTAssertTrue(instance.jumpGame(nums), "Can jump")
        
        nums = [2, 3, 0, 0, 0, 8]
        XCTAssertFalse(instance.jumpGame(nums), "Can't jump")
        
    }
    
    func testJumpGameII() {
        var nums = [2, 3, 0, 0, 9]
        let instance = JumpGame()
        XCTAssertEqual(2, instance.jumpGameII(nums), "min 2 steps")
        
        nums = [7, 3, 0, 0, 0, 8]
        XCTAssertEqual(1, instance.jumpGameII(nums), "min 1 steps")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
