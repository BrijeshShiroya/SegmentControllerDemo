//
//  MyFirstKIFTest.swift
//  SegmentControllerDemoTests
//
//  Created by Creole02 on 11/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//
import KIF
import XCTest

class MyFirstKIFTest: KIFTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testContinueWithoutSaving_ShowsNextScreen_WithCorrectText() {
//        tester().tapView(withAccessibilityLabel: "Continue, without saving")  // 1
//        tester().waitForView(withAccessibilityLabel: "Welcome Player 1")      // 2
//        tester().tapView(withAccessibilityLabel: "Start Over")                // 3
    }
    
}
