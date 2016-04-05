//
//  CommonClass.swift
//  common
//
//  Created by Jedediah Micka on 4/1/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//

import Foundation;

public class CommonClass {
    let string = "Hello World\n\r";
    
    public init () {
        print("initializing");
    }
    
    public func getString() -> String {
        return self.string;
    }
}