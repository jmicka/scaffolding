//
//  SampleViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

class SampleViewController : NSViewController {
    private var view_color: Color = Color.Black;
    
    convenience init(color: Color) {
        self.init();
        self.view_color = color;
    }
    
    override func loadView() {
        self.view = NSView(frame: NSMakeRect(300,300,150,100));
        self.view.wantsLayer = true;
        self.view.layer?.borderWidth = 2;
        self.view.layer?.borderColor = self.view_color.osx.CGColor;
        self.view.hidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
}