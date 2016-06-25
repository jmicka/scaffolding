//
//  AppDelegate.swift
//  osx
//
//  Created by Jedediah Micka on 4/1/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Cocoa;
import osx_common;

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?;
    var controller: MainViewController?;
    var datastore: DataPersistence = DataPersistence();
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        app.activateIgnoringOtherApps(true);
        
        self.createViewLayout();
        window!.makeKeyAndOrderFront(nil);
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        do {
            try datastore.saveContext();
        } catch {
            abort();
        }
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplicationTerminateReply {
        
        if !datastore.commitEditing() {
            NSLog("\(NSStringFromClass(self.dynamicType)) unable to commit editing to terminate");
            return .terminateCancel;
        }
        
        if !datastore.hasChanges {
            return .terminateNow;
        }
        
        do {
            try datastore.saveContext();
        } catch {
            let nserror = error as NSError;
            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror);
            if (result) {
                return .terminateCancel;
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message");
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title");
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title");
            let alert = NSAlert();
            alert.messageText = question;
            alert.informativeText = info;
            alert.addButton(withTitle: quitButton);
            alert.addButton(withTitle: cancelButton);
            
            let answer = alert.runModal();
            if answer == NSAlertFirstButtonReturn {
                return .terminateCancel;
            }
        }
        // If we got here, it is time to quit.
        return .terminateNow;
    }

    func windowWillReturnUndoManager(_ window: NSWindow) -> UndoManager? {
        return datastore.undoManager;
    }
    
    
    
    // MARK: Menu-related functions
    func aboutAction(_ sender: AnyObject!) {
    }
    
    func saveAction(_ sender: AnyObject!) {
        do {
            try datastore.saveContext();
        } catch {
        }
    }
    
    func quitAction(_ sender: AnyObject!) {
        applicationShouldTerminate(app);
    }
    
    func viewWindow1Action(_ sender: AnyObject!) {
        controller?.loadFirstVC();
    }
    
    func viewWindow2Action(_ sender: AnyObject!) {
        controller?.loadSecondVC();
    }
    
    
    
    // MARK: Private functions
    private func createViewLayout() {
        let mask: NSWindowStyleMask = NSWindowStyleMask([.titled, .resizable, .miniaturizable, .closable]);
        
        self.window = NSWindow(contentRect: NSMakeRect(100, 100, 800, 600), styleMask: mask, backing: NSBackingStoreType.buffered, defer: false);
        self.window?.title = NSLocalizedString("App Title", comment: "title of application");
        
        self.controller = MainViewController();
        self.window!.contentView!.addSubview(controller!.view);
        

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
                NSMenuItem(title: NSLocalizedString("Panel 1", comment: "panel 1 menu item"),  action: #selector(self.viewWindow1Action(_:)), keyEquivalent:""),
                NSMenuItem(title: NSLocalizedString("Panel 2", comment: "panel 2 menu item"),  action: #selector(self.viewWindow2Action(_:)), keyEquivalent:""),
            ]
        ];
        
        let main_menu = NSMenu();
        
        for (title, items) in menu_tree {
            let menu = NSMenu(title: title);
            if let item: NSMenuItem? = main_menu.addItem(withTitle: title, action: nil, keyEquivalent:"") {
                main_menu.setSubmenu(menu, for: item!);
                for item in items {
                    menu.addItem(item);
                }
            }
        }
        
        app.menu = main_menu;
    }
}
