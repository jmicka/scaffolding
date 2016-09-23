//
//  SampleView.swift
//  scaffolding
//
//  Created by Jedediah Micka on 9/15/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit
import ios_common

/**
 
 Class controlling a sample view that displays a colored outline of a box in the center of the screen.
 
 */

class SampleView: UIView {
    /// Visible subview in the view
    let subview = UIView();
    /// color of the border of the visible region
    fileprivate var view_color: Color = Color.Black;
    
    init(frame: CGRect, color: Color) {
        
        super.init(frame: frame);
        
        self.view_color = color;
        
        self.layer.backgroundColor = Color.Clear.ios.cgColor;
        self.isHidden = false;
        
        subview.translatesAutoresizingMaskIntoConstraints = false;
        subview.layer.isOpaque = true;
        subview.layer.opacity = 1.0;
        subview.layer.backgroundColor = Color.Clear.ios.cgColor;
        subview.layer.borderWidth = CGFloat(Constants.ModalBorderWidth);
        subview.layer.cornerRadius = CGFloat(Constants.ModalBevelRadius);
        subview.layer.borderColor = view_color.ios.cgColor;
        subview.layer.masksToBounds = true;
        
        self.addSubview(subview);
        
        subview.heightAnchor.constraint(greaterThanOrEqualToConstant: 100.0).isActive = true;
        subview.widthAnchor.constraint(greaterThanOrEqualToConstant: 150.0).isActive = true;
        subview.heightAnchor.constraint(lessThanOrEqualToConstant: 200.0).isActive = true;
        subview.widthAnchor.constraint(lessThanOrEqualToConstant: 300.0).isActive = true;
        subview.widthAnchor.constraint(equalTo: subview.heightAnchor, multiplier: 1.5).isActive = true;
        
        self.centerXAnchor.constraint(equalTo: subview.centerXAnchor).isActive = true;
        self.centerYAnchor.constraint(equalTo: subview.centerYAnchor).isActive = true;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


