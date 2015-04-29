//
//  Color.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS)
	import UIKit.UIColor
	public typealias Color = UIColor
#else
	import AppKit.NSColor
	public typealias Color = NSColor

	extension NSColor {
		public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
			self.init(SRGBRed: red, green: green, blue: blue, alpha: alpha)
		}
	}
#endif
