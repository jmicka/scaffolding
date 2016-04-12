//
//  MainViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let rootviewcontroller: UITabBarController = UITabBarController();
    let NAVBAR_COLOR: UIColor = UIColor(red: (37.0 / 255.0), green: (85.0 / 255.0), blue: (183.0 / 255.0), alpha: 1.0);
    let NAVBAR_FONT: UIFont = UIFont(name: "Georgia", size: 22)!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.CreateViewLayout();
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        // must attach after the root view controller appears
        let nav: UINavigationController = UINavigationController( rootViewController: rootviewcontroller );
        nav.modalPresentationStyle = UIModalPresentationStyle.FullScreen;
        
        let navigationBarAppearace = UINavigationBar.appearance();
        navigationBarAppearace.tintColor = UIColor.purpleColor();
        navigationBarAppearace.barTintColor = UIColor.whiteColor();
        navigationBarAppearace.titleTextAttributes = [ NSForegroundColorAttributeName: NAVBAR_COLOR, NSFontAttributeName: NAVBAR_FONT ];
        
        self.presentViewController(nav, animated: false, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    
    private func CreateViewLayout() {
        let firstVC: SampleViewController  = SampleViewController();
        let secondVC: SampleViewController  = SampleViewController();
        
        let controllers = [firstVC, secondVC]
        rootviewcontroller.viewControllers = controllers;
        
        let firstimage = UIImage(named: "first icon");
        let secondimage = UIImage(named: "second icon");
        
        firstVC.tabBarItem = UITabBarItem(title: "First Tab", image: firstimage, tag: 1);
        secondVC.tabBarItem = UITabBarItem(title: "Second Tab", image: secondimage, tag:2);
    }
}
