//
//  Time.swift
//  UnityKit
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 Creationism. All rights reserved.
//

/*
	Manages global applicatoin timing information. The `time` variable must be updated each frame
	which happens automatically if using an SKScene that inherits from `GameScene`.
*/
public class Time {

	/// The time stamp at application launch.
	private static var globalStartTime: TimeInterval = NSDate().timeIntervalSinceReferenceDate

	/// The time stamp of the last frame.
	private static var lastFrameTime: TimeInterval = 0

	/// The time that has elapsed since the application launched.
	public static var timeSinceStart: TimeInterval {
		return NSDate().timeIntervalSinceReferenceDate - globalStartTime
	}

	/// The current application time.
	public static var time: TimeInterval = 0 {
		willSet {
			lastFrameTime = time
		}
	}

	/// The time that has elapsed since the last frame.
	public static var deltaTime: TimeInterval {
		return time - lastFrameTime
	}
}
