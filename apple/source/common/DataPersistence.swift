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

/**
 
 Class containing all information necessary to manage data persistence; very similar in concept to what NSPersistentContainer
 attempts to do in Swift 3, but given that we are relying on a common framework to handle all game operations (including
 persistence) we need to make sure the NSManagedObjectModel is pulled from the common framework.
 
 TODO:
 - See if we can replace this with an instance ofNSPersistentContainer
 - Finish documenting
 */
public class DataPersistence {
    
    init () {
    }
    
    // MARK: - Core Data stack
    lazy var applicationDocumentsDirectory: Foundation.URL = {
        if (Constants.Device == "ios") {
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
            return urls[urls.count-1];
        } else {
            let urls = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask);
            let appSupportURL = urls[urls.count - 1];
            return appSupportURL.appendingPathComponent("com.jedmicka.osx");
        }
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let bundle_string = "com.jedmicka." + Constants.Device + ".common";
        
        let target_bundle = Bundle(identifier: bundle_string);
        
        let modelURL = target_bundle!.url(forResource: "DataModel", withExtension: "momd")!;
        return NSManagedObjectModel(contentsOf: modelURL)!;
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = nil;
        // merge options to use for attempting to resolve model changes
        let merge_options = [
            NSMigratePersistentStoresAutomaticallyOption: true,
            NSInferMappingModelAutomaticallyOption: true
        ];
        // the errors we will explicitly handle
        let trapped_errors: Set<Int> = [134100];
        
        #if os(OSX)
            let fileManager = FileManager.default;
            var failError: NSError? = nil;
            var shouldFail = false;
            var failureReason = "There was an error creating or loading the application's saved data.";
            
            // Make sure the application files directory is there
            do {
                let properties = try self.applicationDocumentsDirectory.resourceValues(forKeys: [URLResourceKey.isDirectoryKey]);
                
                if !properties.isDirectory! {
                    failureReason = "Expected a folder to store application data, found a file \(self.applicationDocumentsDirectory.path).";
                    shouldFail = true;
                }
            } catch {
                let nserror = error as NSError;
                if nserror.code == NSFileReadNoSuchFileError {
                    do {
                        try fileManager.createDirectory(atPath: self.applicationDocumentsDirectory.path, withIntermediateDirectories: true, attributes: nil);
                    } catch {
                        failError = nserror;
                    }
                } else {
                    failError = nserror;
                }
            }
            
            if failError == nil {
                coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel);
                let url = self.applicationDocumentsDirectory.appendingPathComponent("CoreData.sqlite");
                do {
                    try coordinator!.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: merge_options);
                } catch {
                    failError = error as NSError;
                }
            }
            
            if shouldFail || (failError != nil) {
                // Report any error we got.
                if let error = failError {
                    NSApplication.shared().presentError(error);
                    fatalError("Unresolved error: \(error), \(error.userInfo)");
                }
                fatalError("Unsresolved error: \(failureReason)");
            }
        #elseif os(iOS)
            coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel);
            let url = self.applicationDocumentsDirectory.appendingPathComponent("CoreData.sqlite");
            var failureReason = "There was an error creating or loading the application's saved data.";
            do {
                try coordinator!.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: merge_options);
            } catch {
                if (error._domain == NSCocoaErrorDomain && trapped_errors.contains(error._code)) {
                    // we are attempting to handle this error, so switch on the code
                    switch error._code {
                    case 134100:
                        // NSPersistentStoreTypeMismatchError -- updated model without a migration, so delete it
                        print("ERROR: Persistent store model has been updated, attempting to delete");
                        // TODO: delete store and recreate
                        break;
                    default:
                        // should never reach this case, fail dramatically
                        print("ERROR: Unhandled trapped error while loading persistent store coordinator");
                        abort();
                    }
                } else {
                    // handle other errors accordingly
                    // Report any error we got.
                    var dict = [String: AnyObject]();
                    dict[NSLocalizedDescriptionKey] = ("Failed to initialize the application's saved data" as AnyObject);
                    dict[NSLocalizedFailureReasonErrorKey] = (failureReason as AnyObject);
                    
                    dict[NSUnderlyingErrorKey] = error as NSError;
                    let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict);
                    // Replace this with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)");
                    abort();
                }
            }
        #endif
        return coordinator!;
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
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
    
    var hasChanges: Bool {
        get {
            return !managedObjectContext.hasChanges;
        }
    }
    
    /**
     
     Method which will attempt to save the managed object context; if it is unable to do so it will
     throw an exception. If it succeeds it will return *true*.
     
     */
    func saveContext () throws -> Bool {
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
