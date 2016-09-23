//
//  SampleView.swift
//  scaffolding
//
//  Created by Jedediah Micka on 9/14/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa
import osx_common

/**
 
 Class controlling a sample view that displays a colored outline of a box in the center of the screen.
 
 */

class SampleView: NSView {
    
    let subview = NSView();
    
    fileprivate var view_color: Color = Color.Black;
    
    init(frame: CGRect, color: Color) {
        
        super.init(frame: frame);
        
        self.view_color = color;
        
        self.translatesAutoresizingMaskIntoConstraints = false;
        
        self.autoresizesSubviews = true;
        self.wantsLayer = true;
        self.isHidden = false;
        self.layer!.isOpaque = true;
        self.layer!.opacity = 1.0;
        self.layer!.borderWidth = 0;
        self.layer!.backgroundColor = Color.Gray.osx.cgColor;
        self.autoresizingMask = [NSAutoresizingMaskOptions.viewWidthSizable, NSAutoresizingMaskOptions.viewHeightSizable];
        
        subview.translatesAutoresizingMaskIntoConstraints = false;
        subview.wantsLayer = true;
        subview.layer!.backgroundColor = Color.Clear.osx.cgColor;
        subview.layer!.borderWidth = CGFloat(Constants.ModalBorderWidth);
        subview.layer!.cornerRadius = CGFloat(Constants.ModalBevelRadius);
        subview.layer!.borderColor = view_color.osx.cgColor;
        subview.layer!.masksToBounds = true;
        
        self.addSubview(subview);
        
        subview.heightAnchor.constraint(greaterThanOrEqualToConstant: 200.0).isActive = true;
        subview.widthAnchor.constraint(greaterThanOrEqualToConstant: 300.0).isActive = true;
        subview.heightAnchor.constraint(lessThanOrEqualToConstant: 300.0).isActive = true;
        subview.widthAnchor.constraint(lessThanOrEqualToConstant: 450.0).isActive = true;
        subview.widthAnchor.constraint(equalTo: subview.heightAnchor, multiplier: 1.5).isActive = true;
        
        self.centerXAnchor.constraint(equalTo: subview.centerXAnchor).isActive = true;
        self.centerYAnchor.constraint(equalTo: subview.centerYAnchor).isActive = true;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


