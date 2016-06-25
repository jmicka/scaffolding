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
        self.view = NSView(frame: Constants.OSXWindowFrame);
        self.view.autoresizesSubviews = true;
        self.view.wantsLayer = true;
        self.view.isHidden = true;
        self.view.layer!.isOpaque = true;
        self.view.layer!.opacity = 1.0;
        self.view.layer!.borderWidth = 0;
        self.view.layer!.backgroundColor = Color.Gray.osx.cgColor;
        self.view.autoresizingMask = [NSAutoresizingMaskOptions.viewWidthSizable, NSAutoresizingMaskOptions.viewHeightSizable];
        
        let subview = NSView(frame: CGRect(x: 0, y:0, width: 300, height: 200));
        subview.translatesAutoresizingMaskIntoConstraints = false;
        subview.autoresizesSubviews = true;
        subview.wantsLayer = true;
        subview.layer!.isOpaque = true;
        subview.layer!.opacity = 1.0;
        subview.layer!.borderWidth = 2;
        subview.layer!.borderColor = self.view_color.osx.cgColor;
        subview.layer!.backgroundColor = Color.Clear.osx.cgColor;
        subview.autoresizingMask = [NSAutoresizingMaskOptions.viewWidthSizable, NSAutoresizingMaskOptions.viewHeightSizable];

        
        self.view.addSubview(subview);
        
        // add constraints for views
        let view_dictionary = [
            "subview":subview
        ];
        let metric_dictionary = [
            "subview_height":100.0,
            "subview_width":150.0
        ];
        
        // sizing constraints
        // subview
        let subview_horizontal_size_constraint: Array = NSLayoutConstraint.constraints(withVisualFormat: "H:[subview(subview_width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
        let subview_vertical_size_constraint: Array = NSLayoutConstraint.constraints(withVisualFormat: "V:[subview(subview_height)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
        subview.addConstraints(subview_horizontal_size_constraint);
        subview.addConstraints(subview_vertical_size_constraint);
        
        // position constraints
        // views
        
        // centering
        let subview_constraint_to_horizontally_center: NSLayoutConstraint = NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0);
        let subview_constraint_to_vertically_center: NSLayoutConstraint = NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0);
        view.addConstraint(subview_constraint_to_horizontally_center);
        view.addConstraint(subview_constraint_to_vertically_center);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
}
