//
//  LaunchProgressModalViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 6/5/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

/**
 
 Class controlling the "loading" modal that appears when preparing a game for gameplay..
 
 TODO:
 - implement spinner / progress indicator
 */
class SplashScreen: UIView {
    /// visible portion of the splash screen
    private let modal_subview = UIView();
    /// "loading..." label of the splash screen
    private let loading_label = UILabel();
    
    /**
     
     Class controlling the splash screen view layout.
     
     Parameters:
     - *frame:* The frame within which the view should be constructed.
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.backgroundColor = Color.Clear.ios.cgColor;
        self.isHidden = false;
        
        modal_subview.translatesAutoresizingMaskIntoConstraints = false;
        modal_subview.isOpaque = true;
        modal_subview.layer.backgroundColor = Color.LightSteelBlue.ios.cgColor;
        modal_subview.layer.borderWidth = CGFloat(Constants.ModalBorderWidth);
        modal_subview.layer.cornerRadius = CGFloat(Constants.ModalBevelRadius);
        modal_subview.layer.borderColor = Color.RoyalBlue.ios.cgColor;
        modal_subview.layer.masksToBounds = true;
        
        loading_label.font = UIFont(name: Constants.TitleFontName, size: CGFloat(Constants.TitleFontSize));
        loading_label.textColor = Color.RoyalBlue.ios;
        loading_label.translatesAutoresizingMaskIntoConstraints = false;
        loading_label.text = NSLocalizedString("Loading...", comment: "text displayed while app is loading");
        loading_label.textAlignment = .center;
        
        modal_subview.addSubview(loading_label);
        
        self.addSubview(modal_subview);
        
        modal_subview.heightAnchor.constraint(greaterThanOrEqualToConstant: 200.0).isActive = true;
        modal_subview.widthAnchor.constraint(greaterThanOrEqualToConstant: 300.0).isActive = true;
        modal_subview.heightAnchor.constraint(lessThanOrEqualToConstant: 300.0).isActive = true;
        modal_subview.widthAnchor.constraint(lessThanOrEqualToConstant: 450.0).isActive = true;
        modal_subview.widthAnchor.constraint(equalTo: modal_subview.heightAnchor, multiplier: 1.5).isActive = true;
        modal_subview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        modal_subview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        
        loading_label.heightAnchor.constraint(equalToConstant: 30.0).isActive = true;
        loading_label.widthAnchor.constraint(equalToConstant: 150.0).isActive = true;
        loading_label.centerXAnchor.constraint(equalTo: modal_subview.centerXAnchor).isActive = true;
        loading_label.centerYAnchor.constraint(equalTo: modal_subview.centerYAnchor).isActive = true;
    }
    
    required convenience init(coder: NSCoder) {
        self.init(coder: coder);
    }
    
    init(coder: NSCoder? = nil, frame: CGRect? = nil) {
        if let coder = coder {
            super.init(coder: coder)!;
        } else {
            super.init(frame: frame!);
        }
    }
}
