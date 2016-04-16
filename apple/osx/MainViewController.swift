//
//  MainViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/16/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;


class MainViewController : NSViewController {
    
    let firstVC: SampleViewController = SampleViewController(color: Color.Red);
    let secondVC: SampleViewController  = SampleViewController(color: Color.LightBlue);
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0,y: 0,width: 800,height: 600));
        self.view.wantsLayer = true;
        self.view.layer?.backgroundColor = Color.DarkGray.osx.CGColor;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.createViewLayout();
    }
    
    private func createViewLayout() {
        self.insertChildViewController(firstVC, atIndex: 0);
        self.insertChildViewController(secondVC, atIndex: 1);
        self.view.addSubview(firstVC.view);
        self.view.addSubview(secondVC.view);
        
        self.firstVC.view.hidden = false;
    }
    
    func loadFirstVC() {
        self.firstVC.view.hidden = false;
        self.secondVC.view.hidden = true;
    }
    
    func loadSecondVC() {
        self.secondVC.view.hidden = false;
        self.firstVC.view.hidden = true;
    }
}