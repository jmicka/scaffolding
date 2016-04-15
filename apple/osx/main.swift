//
//  main.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa

let delegate = AppDelegate();
NSApplication.sharedApplication().delegate = delegate;

// start the run loop
NSApplicationMain(Process.argc, Process.unsafeArgv);
