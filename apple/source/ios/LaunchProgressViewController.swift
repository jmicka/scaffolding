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
 - implement
 */
class LaunchProgressModalViewController: UIViewController {
    let modal_subview = UIView(frame: CGRect(x: 0,y: 0,width: 450,height: 300));
    let loading_label = UILabel(frame: CGRect(x:0, y:0, width: 100, height: 30));
    
    override func loadView() {
        self.view = UIView();
        self.view.isOpaque = true;
        self.view.layer.borderWidth = 0;
        self.view.backgroundColor = Color.Clear.ios;
        
        modal_subview.translatesAutoresizingMaskIntoConstraints = false;
        modal_subview.isOpaque = true;
        modal_subview.backgroundColor = Color.LightSteelBlue.ios;
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
        
        self.view.addSubview(modal_subview);
        
        modal_subview.heightAnchor.constraint(greaterThanOrEqualToConstant: 200.0).isActive = true;
        modal_subview.widthAnchor.constraint(greaterThanOrEqualToConstant: 300.0).isActive = true;
        modal_subview.heightAnchor.constraint(lessThanOrEqualToConstant: 300.0).isActive = true;
        modal_subview.widthAnchor.constraint(lessThanOrEqualToConstant: 450.0).isActive = true;
        modal_subview.widthAnchor.constraint(equalTo: modal_subview.heightAnchor, multiplier: 1.5).isActive = true;
        modal_subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        modal_subview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        
        loading_label.centerXAnchor.constraint(equalTo: modal_subview.centerXAnchor).isActive = true;
        loading_label.centerYAnchor.constraint(equalTo: modal_subview.centerYAnchor).isActive = true;
        
        modal_subview.sendSubview(toBack: loading_label);
        view.sendSubview(toBack: modal_subview);
    }
    
    func dismissViewController() {
        self.dismiss(animated: false, completion: nil);
    }
    
    func loadApplication() {
        sleep(2);
    }
}
