//
//  BackgroundView.swift
//  scaffolding
//
//  Created by Jedediah Micka on 9/14/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa
import osx_common

/**
 
 Class controlling the default background view of the main view controller.
 
 */

class BackgroundView: NSView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        self.wantsLayer = true;
        self.autoresizesSubviews = true;
        self.layer!.backgroundColor = Color.DarkGray.osx.cgColor;
        self.autoresizingMask = [NSAutoresizingMaskOptions.viewWidthSizable, NSAutoresizingMaskOptions.viewHeightSizable];
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


