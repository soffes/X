#if os(macOS)
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
