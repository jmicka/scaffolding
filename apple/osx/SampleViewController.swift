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
        self.view = NSView(frame: NSMakeRect(0,0,150,100));
        view.wantsLayer = true;
        view.layer?.borderWidth = 2;
        view.layer?.borderColor = self.view_color.osx.CGColor;
        self.view = view;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
}