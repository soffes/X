#if os(macOS)
import AppKit.NSGraphicsContext
#else
import UIKit.UIGraphics
#endif

@available(OSX 10.10, *)
public func GraphicsGetCurrentContext() -> CGContext? {
	#if os(macOS)
	let context = NSGraphicsContext.current?.cgContext
	#else
	let context = UIGraphicsGetCurrentContext()
	#endif
	
	return context
}
