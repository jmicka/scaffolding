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
    var controller: SampleViewController?;
    var datastore: DataPersistence = DataPersistence();

    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.createViewLayout();
        window!.makeKeyAndOrderFront(nil);
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        do {
            try datastore.saveContext();
        } catch {
            abort();
        }
    }
    
    func saveAction(sender: AnyObject!) {
        do {
            try datastore.saveContext();
        } catch {
        }
    }
    
    func quitAction(sender: AnyObject!) {
        applicationShouldTerminate(app);
    }
    
    func windowWillReturnUndoManager(window: NSWindow) -> NSUndoManager? {
        return datastore.undoManager;
    }
    
    func applicationShouldTerminate(sender: NSApplication) -> NSApplicationTerminateReply {
        
        if !datastore.commitEditing() {
            NSLog("\(NSStringFromClass(self.dynamicType)) unable to commit editing to terminate");
            return .TerminateCancel;
        }
        
        if !datastore.hasChanges {
            return .TerminateNow;
        }
        
        do {
            try datastore.saveContext();
        } catch {
            let nserror = error as NSError;
            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror);
            if (result) {
                return .TerminateCancel;
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message");
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title");
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title");
            let alert = NSAlert();
            alert.messageText = question;
            alert.informativeText = info;
            alert.addButtonWithTitle(quitButton);
            alert.addButtonWithTitle(cancelButton);
            
            let answer = alert.runModal();
            if answer == NSAlertFirstButtonReturn {
                return .TerminateCancel;
            }
        }
        // If we got here, it is time to quit.
        return .TerminateNow;
    }


    
    
    private func createViewLayout() {
        let mask: Int = NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask
        window = NSWindow(contentRect: NSMakeRect(100, 100, 800, 600), styleMask: mask, backing: NSBackingStoreType.Buffered, defer: false);
        window?.title = NSLocalizedString("App Title", comment: "title of application");
        
        controller = SampleViewController();
        let content = window!.contentView!;
        let view = controller!.view;
        content.addSubview(view);
        

        let menu_tree = [
            "App": [
                NSMenuItem(title: NSLocalizedString("Save", comment: "save menu item"),  action: #selector(AppDelegate.saveAction(_:)), keyEquivalent:"s"),
                NSMenuItem(title: NSLocalizedString("Quit", comment: "quit menu item"),  action: #selector(AppDelegate.quitAction(_:)), keyEquivalent:"q"),
                NSMenuItem(title: NSLocalizedString("About", comment: "about menu item"),  action: nil, keyEquivalent:"?"),
            ]
        ];
        
        let main_menu = NSMenu();
        
        for (title, items) in menu_tree {
            let menu = NSMenu(title: title);
            if let item = main_menu.addItemWithTitle(title, action: nil, keyEquivalent:"") {
                main_menu.setSubmenu(menu, forItem: item);
                for item in items {
                    menu.addItem(item);
                }
            }
        }
        
        app.menu = main_menu;
    }
}

