//
//  SumTest.swift
//  SegmentControllerDemoTests
//
//  Created by Creole02 on 11/3/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import XCTest
@testable import SegmentControllerDemo

class SumTest: XCTestCase {
    
    var vc:HomeVC!
    override func setUp() {
        super.setUp()
        vc = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

    
}
