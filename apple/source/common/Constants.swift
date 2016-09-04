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

/**
 
 Struct containing commonly used values throughout the app.
 
 TODO:
 - create some helper structs to contain commonly paired items (e.g. font color, name, size)
 */
public struct Constants {
    /// The name of the device {ios, osx}
    public static let Device: String = device;
    #if os(OSX)
    /// Default frame in which to open the OSX version of the app
    public static let OSXWindowFrame: CGRect = CGRect(x:0, y:0, width: 800, height: 600);
    #endif
    
    // MARK: UI-related constants
    /// Color to be used in title / header sections
    public static let TitleTextColor: Color = Color.DarkSteelBlue;
    /// Name of font to be used in titles
    public static let TitleFontName: String = "Georgia-Bold";
    /// Size of title font
    public static let TitleFontSize: Int = 22;
    /// Color to be used as the background of modal popup
    public static let ModalBackgroundColor: Color = Color.Silver;
    /// Color to be used in borders of modal popups
    public static let ModalBorderColor: Color = Color.DarkSteelBlue;
    /// Width of border in modal popups
    public static let ModalBorderWidth: Float = 2.0;
    /// Radius of rounded edges of a modal popup
    public static let ModalBevelRadius: Float = 15.0;
    /// Color to be used as background of buttons
    public static let ButtonBackgroundColor: Color = Color.Gray;
    /// Color to be used as border of buttons
    public static let ButtonBorderColor: Color = Color.DarkGray;
    /// Width of border used on buttons
    public static let ButtonBorderWidth: Float = 0.5;
    /// Radius of rounded edges on buttons
    public static let ButtonBevelRadius: Float = 8.0;
    /// Color to be used in text label on buttons
    public static let ButtonTextColor: Color = Color.DarkSteelBlue;
    /// Color to be used as text throughout the app
    public static let DefaultTextColor: Color = Color.Charcoal;
}
