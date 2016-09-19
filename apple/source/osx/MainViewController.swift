//
//  MainViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/16/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

/**
 
 Class governing the main view controller for the app.
 
 Parameters:
 - *splash_screen:* (private) splash screen modal view
 - *red_view_controller:* (private) first sample view controller
 - *blue_view_controller:* (private) second sample view controller
 */
class MainViewController : NSViewController {
    // views
    /// view defining modal splash screen content
    private let splash_screen: SplashScreen = SplashScreen(frame: Constants.OSXWindowFrame);
    // view controllers
    /// first sample view controller
    private let red_view_controller: SampleViewController = SampleViewController(color: Color.Red);
    /// second sample view controller
    private let blue_view_controller: SampleViewController  = SampleViewController(color: Color.LightBlue);
    
    override func loadView() {
        self.view = BackgroundView(frame: Constants.OSXWindowFrame);
    }
    
    /**
     
     Displays the sample Red view controller.
     
     */
    func displayRedViewController() {
        self.view = red_view_controller.view;
    }
    
    /**
     
     Displays the sample Blue view controller.
     
     */
    func displayBlueViewController() {
        self.view = blue_view_controller.view;
    }
    
    /**
     
     Displays the splash screen view.
     
     */
    func displaySplashScreen() {
        self.view = splash_screen;
    }
    
    /**
     
     Dismisses the splash screen view.
     
     */
    func dismissSplashScreen() {
        self.view = red_view_controller.view;
    }
}

