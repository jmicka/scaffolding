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
        self.view = NSView(frame: Constants.OSXWindowFrame);
        self.view.autoresizesSubviews = true;
        self.view.wantsLayer = true;
        self.view.layer!.opaque = true;
        self.view.layer!.opacity = 1.0;
        self.view.layer!.borderWidth = 0;
        self.view.layer!.backgroundColor = Color.Clear.osx.CGColor;
        self.view.autoresizingMask = [NSAutoresizingMaskOptions.ViewWidthSizable, NSAutoresizingMaskOptions.ViewHeightSizable];
        
        let subview = NSView(frame: CGRect(x: 0, y:0, width: 300, height: 200));
        subview.translatesAutoresizingMaskIntoConstraints = false;
        subview.autoresizesSubviews = true;
        subview.wantsLayer = true;
        subview.layer!.opaque = true;
        subview.layer!.opacity = 1.0;
        subview.layer!.borderWidth = 2;
        subview.layer!.backgroundColor = Color.Green.osx.CGColor;
        subview.layer!.borderColor = Color.DarkGreen.osx.CGColor;
        subview.autoresizingMask = [NSAutoresizingMaskOptions.ViewWidthSizable, NSAutoresizingMaskOptions.ViewHeightSizable];
        
        self.view.addSubview(subview);
        
        // add constraints for views
        let view_dictionary = [
            "subview":subview
        ];
        let metric_dictionary = [
            "subview_min_height":200.0,
            "subview_max_height":300.0,
            "subview_min_width":300.0,
            "subview_max_width":450.0
        ];
        
        // sizing constraints
        // subview
        let subview_horizontal_size_constraint: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[subview(>=subview_min_width,<=subview_max_width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
        let subview_vertical_size_constraint: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[subview(>=subview_min_height,<=subview_max_height)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
        subview.addConstraints(subview_horizontal_size_constraint);
        subview.addConstraints(subview_vertical_size_constraint);
        
        // position constraints
        // views
        
        // centering
        let subview_constraint_to_horizontally_center: NSLayoutConstraint = NSLayoutConstraint(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0);
        let subview_constraint_to_vertically_center: NSLayoutConstraint = NSLayoutConstraint(item: subview, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0);
        view.addConstraint(subview_constraint_to_horizontally_center);
        view.addConstraint(subview_constraint_to_vertically_center);

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