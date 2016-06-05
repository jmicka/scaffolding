//
//  LaunchProgressViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 6/5/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

class LaunchProgressViewController: UIViewController {
    override func loadView() {
        self.view = UIView();
        self.view.layer.borderWidth = 0;
        self.view.backgroundColor = Color.Clear.ios;
        
        let subview = UIView(frame: CGRect(x: 0,y: 0,width: 300,height: 200));
        subview.translatesAutoresizingMaskIntoConstraints = false;
        subview.backgroundColor = Color.Green.ios;
        subview.layer.borderColor = Color.DarkGreen.ios.CGColor;
        subview.layer.borderWidth = 2;
        
        self.view.addSubview(subview);
        
        // add constraints for views
        let view_dictionary = ["subview":subview];
        let metric_dictionary = ["subview_min_height": 200.0,"subview_max_height": 400.0,"subview_min_width":300.0,"subview_max_width":300.0];
        
        // sizing constraints
        // subview
        let subview_horizontal_size_constraint: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[subview(>=subview_min_width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
        let subview_vertical_size_constraint: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[subview(>=subview_min_height)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
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
        self.view.opaque = true;
    }
    
    func dismissViewController() {
        self.dismissViewControllerAnimated(false, completion: nil);
    }
    
    func loadApplication() {
        sleep(2);
    }
}