//
//  xkcdpassTests.swift
//  xkcdpassTests
//
//  Created by Matthew Rothenberg on 11/8/14.
//  Copyright (c) 2014 Matthew Rothenberg. All rights reserved.
//

import UIKit
import XCTest

class xkcdpassTests: XCTestCase {

    let pg = PasswordGenerator()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //func testExample() {
    //    // This is an example of a functional test case.
    //    XCTAssert(true, "Pass")
    //}

    func testPerformanceDefaultPhraseGeneration() {
        self.measureBlock {
            for _ in 1...10 {
                let _ = self.pg.phrase()
            }
        }
    }

    func testPerformanceDefaultCandidateGeneration() {
        self.measureBlock {
            let _ = self.pg.generateCandidateWords()
        }
    }
    
}
