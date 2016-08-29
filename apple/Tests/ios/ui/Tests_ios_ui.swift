//
//  Tests_ios_ui.swift
//  Tests/ios/ui
//
//  Created by Jedediah Micka on 4/14/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import XCTest;

class Tests_ios_ui: XCTestCase {
    let app = XCUIApplication();
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true;
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch();
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let device = XCUIDevice.shared();
        device.orientation = UIDeviceOrientation.portrait;
    }
    
    override func tearDown() {
        super.tearDown();
        app.terminate();
    }
    
    func testExample() {
    }
}
