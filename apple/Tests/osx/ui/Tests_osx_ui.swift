//
//  Tests_osx_ui.swift
//  Tests/osx/ui
//
//  Created by Jedediah Micka on 4/14/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import XCTest;

class Tests_osx_ui: XCTestCase {
    let app = XCUIApplication();

    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true;
        app.launch();
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        app.terminate();
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
