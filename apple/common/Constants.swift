//
//  Constants.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/5/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Foundation

// define device for use with CoreData
#if os(iOS)
var device: String = "ios"
#elseif os(OSX)
var device: String = "osx"
#else
var device: String = nil
#endif


public struct Constants {
    public static let Device: String = device
}
