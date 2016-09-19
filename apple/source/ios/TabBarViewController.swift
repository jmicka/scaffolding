//
//  TabBarViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 9/17/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit
import ios_common

/**
 
 Class controlling the configuration of the UITabBarController used to provide window
 navigation on iOS versions of the app.
 
 Parameters:
 - *red_view_controller:* (private) sample view controller
 - *blue_view_controller:* (private) sample view controller
 */
class TabBarViewController: UITabBarController {
    /// sample view controller for the red button
    private let red_view_controller: SampleViewController = SampleViewController(color: Color.Red);
    /// sample view controller for the blue button
    private let blue_view_controller: SampleViewController  = SampleViewController(color: Color.LightBlue);
    
    override func viewDidLoad() {
        let controllers = [red_view_controller, blue_view_controller]
        self.viewControllers = controllers;
        
        let first_image = UIImage(named: "first icon");
        let second_image = UIImage(named: "second icon");
        
        red_view_controller.tabBarItem = UITabBarItem(title: "Red Tab", image: first_image, tag: 1);
        blue_view_controller.tabBarItem = UITabBarItem(title: "Blue Tab", image: second_image, tag:2);
    }
    
}
