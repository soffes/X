//
//  Color.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSColor
	public typealias Color = NSColor

	extension NSColor {
		public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
			self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
		}
	}
#else
	import UIKit.UIColor
	public typealias Color = UIColor
#endif

extension Color {
	public convenience init?(hex string: String) {
		var hex = string

		// Remove `#` and `0x`
		if hex.hasPrefix("#") {
			hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 1))
		} else if hex.hasPrefix("0x") {
			hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
		}

		// Invalid if not 3, 6, or 8 characters
		let length = hex.characters.count
		if length != 3 && length != 6 && length != 8 {
			return nil
		}

		// Make the string 8 characters long for easier parsing
		if length == 3 {
			let r = hex.substring(with: hex.startIndex..<hex.index(hex.startIndex, offsetBy: 1))
			let g = hex.substring(with: hex.index(hex.startIndex, offsetBy: 1)..<hex.index(hex.startIndex, offsetBy: 2))
			let b = hex.substring(with: hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 3))
			hex = r + r + g + g + b + b + "ff"
		} else if length == 6 {
			hex = String(hex) + "ff"
		}

		// Convert 2 character strings to CGFloats
		func hexValue(_ string: String) -> CGFloat {
			let value = CGFloat(strtoul(string, nil, 16))
			return value / 255
		}

		let red = hexValue(hex.substring(with: hex.startIndex..<hex.index(hex.startIndex, offsetBy: 2)))
		let green = hexValue(hex.substring(with: hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)))
		let blue = hexValue(hex.substring(with: hex.index(hex.startIndex, offsetBy: 4)..<hex.index(hex.startIndex, offsetBy: 6)))
		let alpha = hexValue(hex.substring(with: hex.index(hex.startIndex, offsetBy: 6)..<hex.index(hex.startIndex, offsetBy: 8)))

		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}

	#if !os(OSX)
		public var redComponent: CGFloat {
			var value: CGFloat = 0.0
			getRed(&value, green: nil, blue: nil, alpha: nil)
			return value
		}

		public var greenComponent: CGFloat {
			var value: CGFloat = 0.0
			getRed(nil, green: &value, blue: nil, alpha: nil)
			return value
		}

		public var blueComponent: CGFloat {
			var value: CGFloat = 0.0
			getRed(nil, green: nil, blue: &value, alpha: nil)
			return value
		}

		public var alphaComponent: CGFloat {
			var value: CGFloat = 0.0
			getRed(nil, green: nil, blue: nil, alpha: &value)
			return value
		}
	#endif
}
