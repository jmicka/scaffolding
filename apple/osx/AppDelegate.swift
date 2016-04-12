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
        window = NSWindow(contentRect: NSMakeRect(10, 10, 300, 300), styleMask: NSResizableWindowMask, backing: NSBackingStoreType.Buffered, defer: false);
        
        controller = SampleViewController();
        let content = window!.contentView!;
        let view = controller!.view;
        content.addSubview(view);
        
        window!.makeKeyAndOrderFront(nil);
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        do {
            try datastore.saveContext();
        } catch {
            abort();
        }
    }
    
    @IBAction func saveAction(sender: AnyObject!) {
        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
        do {
            try datastore.saveContext();
        } catch {
        }
    }
    
    func windowWillReturnUndoManager(window: NSWindow) -> NSUndoManager? {
        // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
        return datastore.undoManager;
    }
    
    func applicationShouldTerminate(sender: NSApplication) -> NSApplicationTerminateReply {
        // Save changes in the application's managed object context before the application terminates.
        
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
            let nserror = error as NSError
            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror)
            if (result) {
                return .TerminateCancel
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButtonWithTitle(quitButton)
            alert.addButtonWithTitle(cancelButton)
            
            let answer = alert.runModal()
            if answer == NSAlertFirstButtonReturn {
                return .TerminateCancel
            }
        }
        // If we got here, it is time to quit.
        return .TerminateNow
    }


}

