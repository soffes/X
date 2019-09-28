#if os(macOS)
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
