//
//  GreetingTests.swift
//  TDDKatas
//
//  Created by Ricardo Quintero on 2017. 06. 28..
//  Copyright © 2017. Ricardo Quintero. All rights reserved.
//

import XCTest
@testable import TDDKatas

class GreetingTests: XCTestCase {

    let greeting = Greeting()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGreetWithName() {
        XCTAssertTrue(greeting.greet("Ricardo") == "Hello, Ricardo.")
    }

    func testGreetNullName() {
        XCTAssertTrue(greeting.greet() == "Hello, my friend.")
    }

    func testGreetShouting() {
        XCTAssertTrue(greeting.greet("RICARDO") == "HELLO RICARDO!")
    }

    func testGreetTwoNames() {
        XCTAssertTrue(greeting.greet("Ricardo", "Gina") == "Hello, Ricardo and Gina.")
    }

    func testGreetMultipleNames() {
        XCTAssertTrue(greeting.greet("Ricardo", "Gina", "Stela") == "Hello, Ricardo, Gina and Stela.")
    }

    func testGreetMultipleNamesWithShout() {
        XCTAssertTrue(greeting.greet("Ricardo", "GINA", "Stela") == "Hello, Ricardo and Stela. AND HELLO GINA!")
    }

    func testGreetWithComma() {
        XCTAssertTrue(greeting.greet("Ricardo", "Gina, Stela") == "Hello, Ricardo, Gina and Stela.")
    }

    func testGreetWithScapedChar() {
        XCTAssertTrue(greeting.greet("Ricardo", "\"Gina, Stela\"") == "Hello, Ricardo and Gina, Stela.")
    }

}
