//
//  AppDelegate.swift
//  osx
//
//  Created by Jedediah Micka on 4/1/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!;
    var datastore: DataPersistence = DataPersistence();


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        let foo = CommonClass();
        print(foo.getString());
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        datastore.saveContext();
    }

}

