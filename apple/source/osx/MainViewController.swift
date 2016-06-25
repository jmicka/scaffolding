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
        self.view = NSView(frame: Constants.OSXWindowFrame);
        self.view.wantsLayer = true;
        self.view.autoresizesSubviews = true;
        self.view.layer!.backgroundColor = Color.DarkGray.osx.cgColor;
        self.view.autoresizingMask = [NSAutoresizingMaskOptions.viewWidthSizable, NSAutoresizingMaskOptions.viewHeightSizable];
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.createViewLayout();
    }
    
    override func viewDidAppear() {
        super.viewDidAppear();
        
        self.showLaunchProgressModal();
    }

    private func createViewLayout() {
        self.insertChildViewController(firstVC, at: 0);
        self.insertChildViewController(secondVC, at: 1);
        self.view.addSubview(firstVC.view);
        self.view.addSubview(secondVC.view);
        
        self.firstVC.view.isHidden = false;
    }

    func loadFirstVC() {
        self.firstVC.view.isHidden = false;
        self.secondVC.view.isHidden = true;
    }
    
    func loadSecondVC() {
        self.secondVC.view.isHidden = false;
        self.firstVC.view.isHidden = true;
    }
    
    func showLaunchProgressModal() {
        let modal_view_controller = LaunchProgressViewController();
        self.presentViewControllerAsSheet(modal_view_controller);
        self.dismissViewController(modal_view_controller);
    }
}
