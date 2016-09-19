//
//  ViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/1/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

/**
 
 Sample streamlined controller for sample view.
 
 */
class SampleViewController: UIViewController {
    
    /**
     
     Initializes the view controller.
     
     Parameters:
     - *color:* color the underlying view should use as its border
     */
    convenience init(color: Color) {
        self.init();
        self.view = SampleView(frame: UIScreen.main.bounds, color: color);
    }
    
}
