//
//  ViewController.swift
//  ios
//
//  Created by Jedediah Micka on 4/1/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

class SampleViewController: UIViewController {
    private var view_color: Color = Color.Black;

    convenience init(color: Color) {
        self.init();
        self.view_color = color;
    }
    
    override func loadView() {
        self.view = UIView();
        self.view.hidden = true;
        self.view.opaque = true;
        self.view.layer.borderWidth = 0;
        self.view.backgroundColor = Color.White.ios;
        
        let subview = UIView(frame: CGRect(x: 0,y: 0,width: 150,height: 100));
        subview.translatesAutoresizingMaskIntoConstraints = false;
        subview.opaque = true;
        subview.layer.borderWidth = 2;
        subview.layer.borderColor = view_color.ios.CGColor;
        subview.layer.backgroundColor = Color.Clear.ios.CGColor;
        
        self.view.addSubview(subview);
        
        // add constraints for views
        let view_dictionary = [
            "subview":subview
        ];
        let metric_dictionary = [
            "subview_height": 100.0,
            "subview_width":150.0
        ];
        
        // sizing constraints
        // subview
        let subview_horizontal_size_constraint: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[subview(subview_width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
        let subview_vertical_size_constraint: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[subview(subview_height)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric_dictionary, views: view_dictionary);
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
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.tabBarController?.title = NSLocalizedString("View - ", comment: "Title for sample view") + self.view_color.description;
        self.view.hidden = false;
    }
}