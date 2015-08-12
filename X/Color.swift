//
//  Color.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(watchOS)
	import UIKit.UIColor
	public typealias ColorType = UIColor
#else
	import AppKit.NSColor
	public typealias ColorType = NSColor

	extension NSColor {
		public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
			self.init(SRGBRed: red, green: green, blue: blue, alpha: alpha)
		}
	}
#endif

public typealias Color = ColorType

extension Color {
	public convenience init?(hex s: String) {
		var hex: NSString = s

		// Remove `#` and `0x`
		if hex.hasPrefix("#") {
			hex = hex.substringFromIndex(1)
		} else if hex.hasPrefix("0x") {
			hex = hex.substringFromIndex(2)
		}

		// Invalid if not 3, 6, or 8 characters
		let length = hex.length
		if length != 3 && length != 6 && length != 8 {
			return nil
		}

		// Make the string 8 characters long for easier parsing
		if length == 3 {
			let r = hex.substringWithRange(NSMakeRange(0, 1))
			let g = hex.substringWithRange(NSMakeRange(1, 1))
			let b = hex.substringWithRange(NSMakeRange(2, 1))
			hex = r + r + g + g + b + b + "ff"
		} else if length == 6 {
			hex = String(hex) + "ff"
		}

		// Convert 2 character strings to CGFloats
		func hexValue(string: String) -> CGFloat {
			let value = Double(strtoul(string, nil, 16))
			return CGFloat(value / 255.0)
		}

		let red = hexValue(hex.substringWithRange(NSMakeRange(0, 2)))
		let green = hexValue(hex.substringWithRange(NSMakeRange(2, 2)))
		let blue = hexValue(hex.substringWithRange(NSMakeRange(4, 2)))
		let alpha = hexValue(hex.substringWithRange(NSMakeRange(6, 2)))

		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
}
