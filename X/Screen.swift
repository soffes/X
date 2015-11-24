//
//  Screen.swift
//  X
//
//  Created by Sam Soffes on 5/1/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSScreen
	public typealias Screen = NSScreen

	extension NSScreen {
		public var scale: CGFloat {
			return backingScaleFactor
		}
	}
#else
	import UIKit.UIScreen
	public typealias Screen = UIScreen
#endif
