//
//  Time.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation

class Time {
    
    private static var globalStartTime: TimeInterval = NSDate().timeIntervalSinceReferenceDate
    private static var lastFrameTime: TimeInterval = 0
    
    
    public static var timeSinceStart: TimeInterval {
        get {
            return NSDate().timeIntervalSinceReferenceDate - globalStartTime
        }
    }
    public static var time: TimeInterval = 0 {
        willSet {
            lastFrameTime = time
        }
    }
    public static var deltaTime: TimeInterval {
        get {
            return time - lastFrameTime
        }
    }
    
    
}
