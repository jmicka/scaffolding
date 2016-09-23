//
//  SplashScreen.swift
//  scaffolding
//
//  Created by Jedediah Micka on 6/5/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;


/**
 
 Class controlling the "loading" modal that appears when preparing a game for gameplay..
 
 */


class SplashScreen: NSView {
    
    let modal_view = NSView();
    let loading_label = NSTextView();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        modal_view.translatesAutoresizingMaskIntoConstraints = false;
        modal_view.wantsLayer = true;
        modal_view.layer!.backgroundColor = Color.LightSteelBlue.osx.cgColor;
        modal_view.layer!.borderWidth = CGFloat(Constants.ModalBorderWidth);
        modal_view.layer!.cornerRadius = CGFloat(Constants.ModalBevelRadius);
        modal_view.layer!.borderColor = Color.RoyalBlue.osx.cgColor;
        modal_view.layer!.masksToBounds = true;
        
        loading_label.font = NSFont(name: Constants.TitleFontName, size: CGFloat(Constants.TitleFontSize));
        loading_label.textColor = Color.RoyalBlue.osx;
        loading_label.translatesAutoresizingMaskIntoConstraints = false;
        loading_label.alignment = .center;
        loading_label.backgroundColor = Color.Clear.osx;
        loading_label.string = NSLocalizedString("Loading...", comment: "text displayed while app is loading");
        
        modal_view.addSubview(loading_label);
        self.addSubview(modal_view);
        
        modal_view.heightAnchor.constraint(greaterThanOrEqualToConstant: 200.0).isActive = true;
        modal_view.widthAnchor.constraint(greaterThanOrEqualToConstant: 300.0).isActive = true;
        modal_view.heightAnchor.constraint(lessThanOrEqualToConstant: 300.0).isActive = true;
        modal_view.widthAnchor.constraint(lessThanOrEqualToConstant: 450.0).isActive = true;
        modal_view.widthAnchor.constraint(equalTo: modal_view.heightAnchor, multiplier: 1.5).isActive = true;
        modal_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        modal_view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        
        loading_label.heightAnchor.constraint(equalToConstant: 30.0).isActive = true;
        loading_label.widthAnchor.constraint(equalToConstant: 150.0).isActive = true;
        loading_label.centerXAnchor.constraint(equalTo: modal_view.centerXAnchor).isActive = true;
        loading_label.centerYAnchor.constraint(equalTo: modal_view.centerYAnchor).isActive = true;
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


