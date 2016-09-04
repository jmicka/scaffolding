//
//  Colors.swift
//  scaffolding
//
//  Created by Jedediah Micka on 4/13/16.
//  Copyright © 2016 Jedediah Micka. All rights reserved.
//


import Foundation
#if os(iOS)
    import UIKit;
#elseif os(OSX)
    import AppKit;
#endif

/**
 
 Common Color definitions for use within the application.
 
 */
public enum Color : Int {
    case None = 0;
    case Black;
    case Charcoal;
    case Clear;
    case DarkGray;
    case DarkGreen;
    case DarkOrange;
    case DarkRed;
    case DarkSteelBlue;
    case DarkYellow;
    case Gray;
    case Green;
    case Gold;
    case LightBlue;
    case LightSteelBlue;
    case Orange;
    case Red;
    case RoyalBlue;
    case Silver;
    case White;
    case Yellow;
    
    #if os(iOS)
    /// ios-specific color codes (UIColor)
    public var ios: UIColor {
        get {
            switch self {
            case .Black: return UIColor.black;
            case .Charcoal: return UIColor(red: 0.212, green: 0.271, blue: 0.310, alpha: 1.0);
            case .Clear: return UIColor.clear;
            case .DarkGray: return UIColor(red: (55.0 / 255.0), green: (56.0 / 255.0), blue: (61.0 / 255.0), alpha: 1.0);
            case .DarkGreen: return UIColor(red: (7.0 / 255.0), green: (82.0 / 255.0), blue: (4.0 / 255.0), alpha: 1.0);
            case .DarkOrange: return UIColor(red: (158.0 / 255.0), green: (61.0 / 255.0), blue: (2.0 / 255.0), alpha: 1.0);
            case .DarkRed: return UIColor(red: (137.0 / 255.0), green: (1.0 / 255.0), blue: (1.0 / 255.0), alpha: 1.0);
            case .DarkSteelBlue: return UIColor(red: (37.0 / 255.0), green: (85.0 / 255.0), blue: (183.0 / 255.0), alpha: 1.0);
            case .DarkYellow: return UIColor(red: (151.0 / 255.0), green: (130.0 / 255.0), blue: (14.0 / 255.0), alpha: 1.0);
            case .Gray: return UIColor.gray;
            case .Green: return UIColor(red: (47.0 / 255.0), green: (145.0 / 255.0), blue: (43.0 / 255.0), alpha: 1.0);
            case .Gold: return UIColor(red: (238.0 / 255.0), green: (202.0 / 255.0), blue: (2.0 / 255.0), alpha: 1.0);
            case .LightBlue: return UIColor(red: (7.0 / 255.0), green: (192.0 / 255.0), blue: (217.0 / 255.0), alpha: 1.0);
            case .LightSteelBlue: return UIColor(red: (176.0 / 255.0), green: (196.0 / 255.0), blue: (222.0 / 255.0), alpha: 1.0);
            case .None: return UIColor.clear;
            case .Orange: return UIColor.orange;
            case .Red: return UIColor.red;
            case .RoyalBlue: return UIColor(red: (65.0 / 255.0), green: (105.0 / 255.0), blue: (225.0 / 255.0), alpha: 1.0);
            case .Silver: return UIColor(red: (204.0 / 255.0), green: (204.0 / 255.0), blue: (204.0 / 255.0), alpha: 1.0);
            case .White: return UIColor.white;
            case .Yellow: return UIColor(red: (191.0 / 255.0), green: (196.0 / 255.0), blue: (35.0 / 255.0), alpha: 1.0);
            }
        }
    }
    #elseif os(OSX)
    /// osx-specific color codes (NSColor)
    public var osx: NSColor {
    get {
    switch self {
    case .Black: return NSColor.black;
    case .Charcoal: return NSColor(red: 0.212, green: 0.271, blue: 0.310, alpha: 1.0);
    case .Clear: return NSColor.clear;
    case .DarkGray: return NSColor(red: (55.0 / 255.0), green: (56.0 / 255.0), blue: (61.0 / 255.0), alpha: 1.0);
    case .DarkGreen: return NSColor(red: (7.0 / 255.0), green: (82.0 / 255.0), blue: (4.0 / 255.0), alpha: 1.0);
    case .DarkOrange: return NSColor(red: (158.0 / 255.0), green: (61.0 / 255.0), blue: (2.0 / 255.0), alpha: 1.0);
    case .DarkRed: return NSColor(red: (137.0 / 255.0), green: (1.0 / 255.0), blue: (1.0 / 255.0), alpha: 1.0);
    case .DarkSteelBlue: return NSColor(red: (37.0 / 255.0), green: (85.0 / 255.0), blue: (183.0 / 255.0), alpha: 1.0);
    case .DarkYellow: return NSColor(red: (151.0 / 255.0), green: (130.0 / 255.0), blue: (14.0 / 255.0), alpha: 1.0);
    case .Gray: return NSColor.gray;
    case .Green: return NSColor(red: (47.0 / 255.0), green: (145.0 / 255.0), blue: (43.0 / 255.0), alpha: 1.0);
    case .Gold: return NSColor(red: (238.0 / 255.0), green: (202.0 / 255.0), blue: (2.0 / 255.0), alpha: 1.0);
    case .LightBlue: return NSColor(red: (7.0 / 255.0), green: (192.0 / 255.0), blue: (217.0 / 255.0), alpha: 1.0);
    case .LightSteelBlue: return NSColor(red: (176.0 / 255.0), green: (196.0 / 255.0), blue: (222.0 / 255.0), alpha: 1.0);
    case .None: return NSColor.clear;
    case .Orange: return NSColor.orange;
    case .Red: return NSColor.red;
    case .RoyalBlue: return NSColor(red: (65.0 / 255.0), green: (105.0 / 255.0), blue: (225.0 / 255.0), alpha: 1.0);
    case .Silver: return NSColor(red: (204.0 / 255.0), green: (204.0 / 255.0), blue: (204.0 / 255.0), alpha: 1.0);
    case .White: return NSColor.white;
    case .Yellow: return NSColor(red: (191.0 / 255.0), green: (196.0 / 255.0), blue: (35.0 / 255.0), alpha: 1.0);
    }
    }
    }
    #endif
}

// required overload for equatable
public func == (lhs: Color, rhs:Color) -> Bool {
    return (lhs.rawValue == rhs.rawValue);
}

extension Color : CustomStringConvertible {
    /// Name of color for use when printing object
    public var description: String {
        get {
            switch self {
            case .Black: return NSLocalizedString("black", comment: "name of color");
            case .Charcoal: return NSLocalizedString("charcoal", comment: "name of color");
            case .Clear: return NSLocalizedString("clear", comment: "name of color");
            case .DarkGray: return NSLocalizedString("dark gray", comment: "name of color");
            case .DarkGreen: return NSLocalizedString("dark green", comment: "name of color");
            case .DarkOrange: return NSLocalizedString("dark orange", comment: "name of color");
            case .DarkRed: return NSLocalizedString("dark red", comment: "name of color");
            case .DarkSteelBlue: return NSLocalizedString("dark steel-blue", comment: "name of color");
            case .DarkYellow: return NSLocalizedString("dark yellow", comment: "name of color");
            case .Gray: return NSLocalizedString("gray", comment: "name of color");
            case .Green: return NSLocalizedString("green", comment: "name of color");
            case .Gold: return NSLocalizedString("gold", comment: "name of color");
            case .LightBlue: return NSLocalizedString("light blue", comment: "name of color");
            case .LightSteelBlue: return NSLocalizedString("light steel-blue", comment: "name of color");
            case .None: return NSLocalizedString("none", comment: "name of color");
            case .Orange: return NSLocalizedString("orange", comment: "name of color");
            case .Red: return NSLocalizedString("red", comment: "name of color");
            case .RoyalBlue: return NSLocalizedString("royal blue", comment: "name of color");
            case .Silver: return NSLocalizedString("silver", comment: "name of color");
            case .White: return NSLocalizedString("white", comment: "name of color");
            case .Yellow: return NSLocalizedString("yellow", comment: "name of color");
            }
        }
    }
}
