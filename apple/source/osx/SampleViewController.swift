//
//  SampleViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

/**
 
 Class controlling the sample view.
 
 */
class SampleViewController : NSViewController {
    
    /**
     
     Initializes the app.
     
     Parameters:
     - *color:* the color the box should appear in the view controller's sample view
     */
    convenience init(color: Color) {
        self.init();
        self.view = SampleView(frame: Constants.OSXWindowFrame, color: color);
    }
}
