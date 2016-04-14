//
//  ColorTests.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/14/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import XCTest;
@testable import osx_common;

class ColorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testColorEquality() {
        let color1: Color = Color.Red;
        let color2: Color = Color.Red;
        let color3: Color = Color.White;
        
        XCTAssertEqual(color1, color2, "two identical color objects should be equal");
        XCTAssertNotEqual(color1, color3, "two unequal color objects should not be equal");
    }
    
}
