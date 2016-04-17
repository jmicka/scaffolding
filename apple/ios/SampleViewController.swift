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
        self.view = UIView(frame: CGRect(x: 0,y: 0,width: 100,height: 50));
        self.view.layer.borderWidth = 2;
        self.view.layer.borderColor = self.view_color.ios.CGColor;
        self.view.hidden = true;
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
