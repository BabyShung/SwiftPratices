//
//  UniquePathsTests.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 1/20/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import XCTest
@testable import SwiftPratices

class UniquePathsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUniquePathsNil() {
        let instance = UniquePaths()
        XCTAssertEqual(0, instance.uniquePath(0, n: 0))
        XCTAssertEqual(0, instance.uniquePath(0, n: 3))
        XCTAssertEqual(0, instance.uniquePath(6, n: 0))
    }
    
    func testUniquePaths() {
        let instance = UniquePaths()
        XCTAssertEqual(1, instance.uniquePath(1, n: 99))
        XCTAssertEqual(2, instance.uniquePath(2, n: 2))
    }
    
    func testUniquePathsII() {
        let instance = UniquePaths()
        let gird = [
                        [0, 1, 0],
                        [0, 0, 0],
                        [1, 0, 0]
        ]
        let gird1 = [
            [1, 1, 0],
            [0, 0, 0],
            [1, 0, 0]
        ]
        XCTAssertEqual(2, instance.uniquePathII(gird))
        XCTAssertEqual(0, instance.uniquePathII(gird1))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
