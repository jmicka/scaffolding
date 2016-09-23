//
//  AppDelegate.swift
//  osx
//
//  Created by Jedediah Micka on 4/1/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

/**
 
 App delegate for OS X application.
 
 Parameters:
 - *window:* window of the app
 - *controller:* primary view controller for the app
 - *engine:* core game engine, loaded as module
 */
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!;
    var controller: MainViewController = MainViewController();
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let mask = NSWindowStyleMask([.titled, .resizable, .miniaturizable, .closable]);
        window = NSWindow(contentRect: Constants.OSXWindowFrame, styleMask: mask, backing: NSBackingStoreType.buffered, defer: false);
        app.activate(ignoringOtherApps: true);
        self.createWindowLayout();
        window.makeKeyAndOrderFront(nil);
        
        self.displaySplashScreen();
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplicationTerminateReply {
        return .terminateNow;
    }
    
    func windowWillReturnUndoManager(_ window: NSWindow) -> UndoManager? {
        return nil;
    }
    
    
    
    // MARK: (private) Menu-related functions
    /**
     
     Handles action when user clicks "About".
     
     Parameters:
     - *sender:* object that sent the request
     */
    @objc private func aboutAction(_ sender: AnyObject!) {
    }
    
    /**
     
     Handles action when user clicks "Save". Propagates latest changes to current game to disk.
     
     Parameters:
     - *sender:* object that sent the request
     */
    @objc private func saveAction(_ sender: AnyObject!) {
    }
    
    /**
     
     Handles action when user clicks "Quit". Terminates the app.
     
     Parameters:
     - *sender:* object that sent the request
     */
    @objc private func quitAction(_ sender: AnyObject!) {
        _ = applicationShouldTerminate(app);
    }
    
    /**
     
     Handles action when user clicks "Window -> Red Window".
     
     Parameters:
     - *sender:* object that sent the request
     */
    @objc private func displayRedWindow(_ sender: AnyObject!) {
        _ = controller.displayRedViewController();
    }
    
    /**
     
     Handles action when user clicks "Window -> Blue Window".
     
     Parameters:
     - *sender:* object that sent the request
     */
    @objc private func displayBlueWindow(_ sender: AnyObject!) {
        _ = controller.displayBlueViewController();
    }
    
    
    
    // MARK: Private functions
    /**
     
     Creates basic window layout for app.
     */
    private func createWindowLayout() {
        
        self.window.title = NSLocalizedString("App Title", comment: "title of application");
        self.window.contentViewController = controller;
        
        let menu_tree = [
            "Apple": [
                NSMenuItem(title: NSLocalizedString("About", comment: "about menu item"),  action: #selector(self.quitAction(_:)), keyEquivalent:"?"),
                NSMenuItem.separator(),
                NSMenuItem(title: NSLocalizedString("Quit", comment: "quit menu item"),  action: #selector(self.quitAction(_:)), keyEquivalent:"q"),
            ],
            "File": [
                NSMenuItem(title: NSLocalizedString("Save", comment: "save menu item"),  action: #selector(self.saveAction(_:)), keyEquivalent:"s"),
            ],
            "Window": [
                NSMenuItem(title: NSLocalizedString("Red Window", comment: "red window menu item"),  action: #selector(self.displayRedWindow(_:)), keyEquivalent:""),
                NSMenuItem(title: NSLocalizedString("Blue Window", comment: "blue window menu item"),  action: #selector(self.displayBlueWindow(_:)), keyEquivalent:""),
            ]
        ];
        
        let main_menu = NSMenu();
        
        for (title, items) in menu_tree {
            let menu = NSMenu(title: title);
            let item: NSMenuItem = main_menu.addItem(withTitle: title, action: nil, keyEquivalent: "");
            main_menu.setSubmenu(menu, for: item);
            for item in items {
                menu.addItem(item);
            }
        }
        
        app.menu = main_menu;
    }
    
    /**
     
     Displays splash screen modal.
     */
    private func displaySplashScreen() {
        controller.displaySplashScreen();
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            self.loadGame();
        }
    }
    
    /**
     
     Loads game content.
     */
    private func loadGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(750)) {
            self.dismissSplashScreen();
        }
    }
    
    /**
     
     Dismisses splash screen modal.
     */
    private func dismissSplashScreen() {
        controller.dismissSplashScreen();
    }
}
