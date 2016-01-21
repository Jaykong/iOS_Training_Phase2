//
//  CodeCollectionCellUITests.swift
//  CodeCollectionCellUITests
//
//  Created by trainer on 1/16/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import XCTest

class CodeCollectionCellUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       // XCTAssert(4 == 3 + 5)
        XCTAssertEqual(4,4,"4 equal 3" )
    }
    
    func testExpectation() {
        let openExpectation = self.expectationWithDescription("some thing to do")
        doSomthing { () -> Void in
            print("I want you ")
            openExpectation.fulfill()
        }
       
        self.waitForExpectationsWithTimeout(1) { (error) -> Void in
            print(error)
        }
    }
    
    func doSomthing(sth:()->Void) {
        for i in 1...10000 {
            print(i)
        }
        sth()
        
    }
   func testPerformance() {
    self.measureBlock { () -> Void in
       self.doSomthing({ () -> Void in
        print("meme")
       })
    }
    }
   
}
