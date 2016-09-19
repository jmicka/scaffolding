//
//  MainViewController.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import UIKit;
import ios_common;

/**
 
 Class governing the top-level view controller.
 
 */
class MainViewController: UIViewController {
    /// application delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate;
    
    // views
    
    // view controllers
    /// primary view controller
    let root_view_controller: TabBarViewController = TabBarViewController();
    /// splash screen view controller
    let splash_screen_controller: SplashScreenViewController = SplashScreenViewController(frame: UIScreen.main.bounds);
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        let navbar_font: UIFont = UIFont(name: Constants.TitleFontName, size: CGFloat(Constants.TitleFontSize))!;
        
        // must attach after the root view controller appears
        let nav: UINavigationController = UINavigationController( rootViewController: root_view_controller );
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen;
        
        let navigation_bar_appearace = UINavigationBar.appearance();
        navigation_bar_appearace.tintColor = Color.DarkSteelBlue.ios;
        navigation_bar_appearace.barTintColor = Color.White.ios;
        navigation_bar_appearace.titleTextAttributes = [ NSForegroundColorAttributeName: Constants.TitleTextColor.ios, NSFontAttributeName: navbar_font ];
        
        self.present(nav, animated: false, completion: nil);
        
        self.displaySplashScreen();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    @nonobjc func shouldAutorotate() -> Bool {
        // permit any recognized autorotate except upside down
        if (UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown ||
            UIDevice.current.orientation == UIDeviceOrientation.unknown) {
            return false;
        }
        else {
            return true;
        }
    }
    
    /**
     
     Presents controller governing splash screen.
     
     */
    func displaySplashScreen() {
        splash_screen_controller.modalPresentationStyle = .overCurrentContext;
        root_view_controller.present(splash_screen_controller, animated: false, completion: nil);
    }
    
    /**
     
     Dismisses controller governing splash screen.
     
     */
    func dismissSplashScreen() {
        self.splash_screen_controller.dismiss(animated: false, completion: nil);
    }
}


