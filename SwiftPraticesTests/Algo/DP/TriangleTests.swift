//
//  TriangleTests.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 1/15/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import XCTest
@testable import SwiftPratices

class TriangleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTriangleNil() {
        let instance = Triangle()
        let empty: [[Int]?]? = nil
        XCTAssertEqual(0, instance.minimalPathSum(empty), "should be 0")
    }
    
    func testTriangleNormal() {
        let instance = Triangle()
        let array: [[Int]?]? = [
                                    [1],
                                    [1,3],
                                    [5,4,1]
                                ]
        XCTAssertEqual(5, instance.minimalPathSum(array), "not the minimal")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
