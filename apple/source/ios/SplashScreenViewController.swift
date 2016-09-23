//
//  SplashScreenViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 9/16/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

/**
 
 Controller governing the SplashScreen.
 
 */
class SplashScreenViewController : UIViewController {
    
    /**
     
     Initializes the view controller.
     
     Parameters:
     - *frame:* frame within which to create the view
     */
    convenience init(frame: CGRect) {
        self.init();
        self.view = SplashScreen(frame: frame);
    }
}
