#if os(macOS) || os(watchOS)
	public enum ContentMode : Int {
		case scaleToFill
		case scaleAspectFit
		case scaleAspectFill
		case redraw
		case center
		case top
		case bottom
		case left
		case right
		case topLeft
		case topRight
		case bottomLeft
		case bottomRight
	}
#elseif os(iOS) || os(tvOS)
	import UIKit.UIView
    public typealias ContentMode = UIView.ContentMode
#endif
