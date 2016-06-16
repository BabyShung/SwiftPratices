
import XCTest
@testable import SwiftPratices
class SearchInsertPositionTests: XCTestCase {

    let sip = SearchInsertPosition()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNil() {
        XCTAssertEqual(0, sip.searchInsertPosition(nil, target: 2), "nil should return 0")
        XCTAssertEqual(0, sip.searchInsertPosition([], target: 2), "nil should return 0")
    }
    
    func testSmall() {
        XCTAssertEqual(0, sip.searchInsertPosition([1], target: 0), "")
        XCTAssertEqual(0, sip.searchInsertPosition([0], target: 0), "")
        XCTAssertEqual(1, sip.searchInsertPosition([0], target: 2), "")
    }
    
    func testNormal() {
        let arr = [1, 3, 5, 7]
        XCTAssertEqual(3, sip.searchInsertPosition(arr, target: 6), "")
        XCTAssertEqual(2, sip.searchInsertPosition(arr, target: 5), "")
        XCTAssertEqual(0, sip.searchInsertPosition(arr, target: 0), "")
        XCTAssertEqual(4, sip.searchInsertPosition(arr, target: 9), "")
        XCTAssertEqual(1, sip.searchInsertPosition(arr, target: 2), "")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
