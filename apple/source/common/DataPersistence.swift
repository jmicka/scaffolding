//
//  DataPersistence.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/5/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Foundation;
import CoreData;
#if os(OSX)
import Cocoa;
#endif

public class DataPersistence {
    
    public init () {
    }

    // MARK: - Core Data stack
    public lazy var applicationDocumentsDirectory: NSURL = {
        if (Constants.Device == "ios") {
            let urls = FileManager.default().urlsForDirectory(.documentDirectory, inDomains: .userDomainMask);
            return urls[urls.count-1];
        } else {
            let urls = FileManager.default().urlsForDirectory(.applicationSupportDirectory, inDomains: .userDomainMask);
            var appSupportURL = urls[urls.count - 1];
            do {
                //TODO: clean this handling up
                try appSupportURL = appSupportURL.appendingPathComponent("com.jedmicka.osx");
            } catch {
                abort();
            }
            return appSupportURL;
        }
    }()
    
    public lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main().urlForResource(Constants.Device, withExtension: "momd")!;
        return NSManagedObjectModel(contentsOf: modelURL)!;
    }()
    
    public lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        
        var coordinator: NSPersistentStoreCoordinator? = nil;
        
        if (Constants.Device == "ios") {
            coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel);
            let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite");
            var failureReason = "There was an error creating or loading the application's saved data.";
            do {
                try coordinator!.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil);
            } catch {
                // Report any error we got.
                var dict = [String: AnyObject]();
                dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data";
                dict[NSLocalizedFailureReasonErrorKey] = failureReason;
                
                dict[NSUnderlyingErrorKey] = error as NSError;
                let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict);
                // Replace this with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)");
                abort();
            }
        } else {
#if os(OSX)
            let fileManager = FileManager.default();
            var failError: NSError? = nil;
            var shouldFail = false;
            var failureReason = "There was an error creating or loading the application's saved data.";
            
            // Make sure the application files directory is there
            do {
                let properties = try self.applicationDocumentsDirectory.resourceValues(forKeys: [URLResourceKey.isDirectoryKey]);
                if !properties[URLResourceKey.isDirectoryKey]!.boolValue {
                    failureReason = "Expected a folder to store application data, found a file \(self.applicationDocumentsDirectory.path).";
                    shouldFail = true;
                }
            } catch  {
                let failError = error as NSError;
            }
            
            // Create the coordinator and store
            if failError == nil {
                coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel);
                let url = self.applicationDocumentsDirectory.appendingPathComponent("CocoaAppCD.storedata");
                do {
                    try coordinator!.addPersistentStore(ofType: NSXMLStoreType, configurationName: nil, at: url, options: nil);
                } catch {
                    failError = error as NSError;
                }
            }
            
            if shouldFail || (failError != nil) {
                // Report any error we got.
                var dict = [String: AnyObject]();
                dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data";
                dict[NSLocalizedFailureReasonErrorKey] = failureReason;
                if failError != nil {
                    dict[NSUnderlyingErrorKey] = failError;
                }
                let error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict);
                NSApplication.shared().presentError(error);
                abort();
            }
#endif
        }
        return coordinator!;
    }()
    
    public lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator;
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType);
        managedObjectContext.persistentStoreCoordinator = coordinator;
        return managedObjectContext;
    }()
    
    // MARK: - Core Data Saving support
    
    // variables returned to permit OSX and iOS to manage the data persistence layer from the front end
    public var undoManager: UndoManager? {
        get {
            return managedObjectContext.undoManager;
        }
    }
    
    public var hasChanges: Bool {
        get {
            return !managedObjectContext.hasChanges;
        }
    }
    
    public func saveContext () throws -> Bool {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save();
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError;
                NSLog("Unresolved error while saving context \(nserror), \(nserror.userInfo)");
                throw Errors.UnableToSaveContext;
            }
        }
        return true;
    }
    
    public func commitEditing () -> Bool {
#if os(OSX)
        return !managedObjectContext.commitEditing();
#else
    return false;
#endif
    }
}
