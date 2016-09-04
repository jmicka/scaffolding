//
//  MainViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

class MainViewController: UIViewController {
    let root_view_controller: UITabBarController = UITabBarController();
    let NAVBAR_COLOR: UIColor = Color.DarkSteelBlue.ios;
    
    let NAVBAR_FONT: UIFont = UIFont(name: "Georgia", size: 22)!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.createViewLayout();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        
        // must attach after the root view controller appears
        let nav: UINavigationController = UINavigationController( rootViewController: root_view_controller );
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen;
        
        let navigation_bar_appearace = UINavigationBar.appearance();
        navigation_bar_appearace.tintColor = Color.DarkSteelBlue.ios;
        navigation_bar_appearace.barTintColor = Color.White.ios;
        navigation_bar_appearace.titleTextAttributes = [ NSForegroundColorAttributeName: NAVBAR_COLOR, NSFontAttributeName: NAVBAR_FONT ];
        
        self.present(nav, animated: false, completion: nil);
        self.showLaunchProgressModal();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    @nonobjc func shouldAutorotate() -> Bool {
        // permit any recognized autorotate except upside down
        if (UIDevice.current.orientation == UIDeviceOrientation.portrait ||
            UIDevice.current.orientation == UIDeviceOrientation.unknown) {
            return false;
        }
        else {
            return true;
        }
    }
    
    
    fileprivate func createViewLayout() {
        let first_view_controller: SampleViewController  = SampleViewController(color: Color.Red);
        let second_view_controller: SampleViewController  = SampleViewController(color: Color.LightBlue);
        
        let controllers = [first_view_controller, second_view_controller]
        root_view_controller.viewControllers = controllers;
        
        let first_image = UIImage(named: "first icon");
        let second_image = UIImage(named: "second icon");
        
        first_view_controller.tabBarItem = UITabBarItem(title: "First Tab", image: first_image, tag: 1);
        second_view_controller.tabBarItem = UITabBarItem(title: "Second Tab", image: second_image, tag:2);
    }
    
    
    
    fileprivate func showLaunchProgressModal() {
        let modal_view_controller = LaunchProgressModalViewController();
        modal_view_controller.modalPresentationStyle = .overCurrentContext;
        root_view_controller.present(modal_view_controller, animated: false, completion: { () -> Void in
            modal_view_controller.loadApplication();
            modal_view_controller.dismissViewController();
        });
    }
}

