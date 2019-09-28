#if os(iOS) || os(tvOS)
    import UIKit.UIScreen
    public typealias Screen = UIScreen
#elseif os(macOS)
	import AppKit.NSScreen
	public typealias Screen = NSScreen

	extension NSScreen {
		public var scale: CGFloat {
			return backingScaleFactor
		}
	}
#endif
