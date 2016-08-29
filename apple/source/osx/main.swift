//
//  main.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/12/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa

let app = NSApplication.shared();
let delegate = AppDelegate();

app.delegate = delegate;

// start the run loop
NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv);

