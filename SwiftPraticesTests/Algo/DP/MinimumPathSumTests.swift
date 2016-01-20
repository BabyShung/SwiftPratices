//
//  MinimumPathSumTests.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 1/19/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import XCTest
@testable import SwiftPratices

class MinimumPathSumTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMinimumPathSum() {
        
        let instance = MinimumPathSum()
        let grid = [
                    [9, 2, 3],
                    [1, 4, 3],
                    [1, 0, 1]
                    ]
        
        XCTAssertEqual(12, instance.minPathSum(grid))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
