//
//  LaunchProgressViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 6/5/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

class LaunchProgressViewController : NSViewController {
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 200));
        self.view.wantsLayer = true;
        self.view.layer?.borderWidth = 2;
        self.view.layer?.opaque = false;
        self.view.layer?.opacity = 0.5;
        self.view.layer?.backgroundColor = Color.Green.osx.CGColor;
        self.view.layer?.borderColor = Color.DarkGreen.osx.CGColor;
    }
    
    override func viewDidLoad() {
    }
    
    override func viewDidAppear() {
        super.viewDidAppear();
        
        self.loadApplication();
    }
    
    func loadApplication() {
        sleep(5);
    }
}