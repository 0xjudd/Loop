//
//  NSUserDefaults.swift
//  Naterade
//
//  Created by Nathan Racklyeft on 3/29/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation


extension NSUserDefaults {
    private enum Key: String {
        case WatchContext = "com.loudnate.Naterade.WatchContext"
        case WatchContextReadyForComplication = "com.loudnate.Naterade.WatchContextReadyForComplication"
    }

    var watchContext: WatchContext? {
        get {
            if let rawValue = dictionaryForKey(Key.WatchContext.rawValue) {
                return WatchContext(rawValue: rawValue)
            } else {
                return nil
            }
        }
        set {
            setObject(newValue?.rawValue, forKey: Key.WatchContext.rawValue)

            watchContextReadyForComplication = newValue != nil
        }
    }

    var watchContextReadyForComplication: Bool {
        get {
            return boolForKey(Key.WatchContextReadyForComplication.rawValue)
        }
        set {
            setBool(newValue, forKey: Key.WatchContextReadyForComplication.rawValue)
        }
    }
}
