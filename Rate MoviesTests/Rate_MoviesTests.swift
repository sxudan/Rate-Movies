//
//  Rate_MoviesTests.swift
//  Rate MoviesTests
//
//  Created by Sudan Suwal on 11/3/1398 AP.
//  Copyright © 1398 Sudan Suwal. All rights reserved.
//

import XCTest
@testable import Rate_Movies

class Rate_MoviesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // simple functional testing
        do{
            let x = try MyHttp().fetchMovies()
            XCTAssert(true, "successfull")
        }catch{
            XCTFail("Failed to fetch")
        }
       
       
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
