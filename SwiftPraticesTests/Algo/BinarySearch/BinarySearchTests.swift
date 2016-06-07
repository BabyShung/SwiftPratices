//
//  BinarySearchTests.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 6/7/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import XCTest
@testable import SwiftPratices
class BinarySearchTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBSNil() {
        let bs = BinarySearch()
        XCTAssertEqual(bs.binarySearch([], target: 9), -1, "should be -1")
    }
    
    func testBSNormal() {
        let bs = BinarySearch()
        XCTAssertEqual(bs.binarySearch([0, 5, 9, 11], target: 5), 1, "should be 1")
    }
    
    func testBSCorner() {
        let bs = BinarySearch()
        XCTAssertEqual(bs.binarySearch([0, 2], target: 2), 1, "should be 1")
        
        XCTAssertEqual(bs.binarySearch([1, 3], target: 1), 0, "should be 0")
        
        XCTAssertEqual(bs.binarySearch([6], target: 6), 0, "should be 0")
        
        XCTAssertEqual(bs.binarySearch([6], target: 1), -1, "should be -1")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
