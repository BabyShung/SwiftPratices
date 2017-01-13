//
//  ClimbingStairsTests.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 2/5/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import XCTest
@testable import SwiftPratices

class ClimbingStairsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testClimbingStairs() {
        let instance = ClimbingStairs()
        XCTAssertEqual(instance.climbStairs(4), 5, "")
        XCTAssertEqual(instance.climbStairs(5), 8, "")
        XCTAssertEqual(instance.climbStairs(6), 13, "")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
