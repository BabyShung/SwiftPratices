
import XCTest
@testable import SwiftPratices
class Search2DMatrixTests: XCTestCase {

    let instance = Search2DMatrix()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNil() {
        XCTAssertFalse(instance.search(nil, target: 2))
    }
    
    func testSmall() {
        let matrix = [
            [0, 1],
            [7, 11]
        ]
        XCTAssertFalse(instance.search(matrix, target: -1))
        XCTAssertFalse(instance.search(matrix, target: 6))
        XCTAssertFalse(instance.search(matrix, target: 20))
        
        XCTAssertTrue(instance.search(matrix, target: 0))
        XCTAssertTrue(instance.search(matrix, target: 1))
        XCTAssertTrue(instance.search(matrix, target: 7))
        XCTAssertTrue(instance.search(matrix, target: 11))
    }
    
    func testNormal() {
        let matrix = [
            [1, 3, 4, 6],
            [8, 11, 20, 22],
            [30, 40, 100, 101]
        ]
        XCTAssertFalse(instance.search(matrix, target: 0))
        XCTAssertFalse(instance.search(matrix, target: 2))
        XCTAssertFalse(instance.search(matrix, target: 103))
        
        XCTAssertTrue(instance.search(matrix, target: 1))
        XCTAssertTrue(instance.search(matrix, target: 11))
        XCTAssertTrue(instance.search(matrix, target: 40))
        XCTAssertTrue(instance.search(matrix, target: 101))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
