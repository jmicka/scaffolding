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
    override func loadView() {
        let view = NSView(frame: NSMakeRect(0,0,100,100));
        view.wantsLayer = true;
        view.layer?.borderWidth = 2;
        view.layer?.borderColor = Color.Red.osx.CGColor;
        self.view = view;
        
        
        let foo = CommonClass();
        print(foo.getString());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}