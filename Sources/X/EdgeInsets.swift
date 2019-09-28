#if os(macOS)
	import AppKit
	public typealias EdgeInsets = NSEdgeInsets
#else
	import UIKit
	public typealias EdgeInsets = UIEdgeInsets
#endif


extension EdgeInsets {
	#if os(macOS)
		public static let zero = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	#endif

	public var flipped: EdgeInsets {
		var insets = self
		insets.top = bottom
		insets.bottom = top
		return insets
	}

	public func insetRect(rect: CGRect) -> CGRect {
		#if os(macOS)
			if (top + bottom > rect.size.height) || (left + right > rect.size.width) {
				return .null
			}

			var insetRect = rect
			insetRect.origin.x += left
			insetRect.origin.y += top;
			insetRect.size.height -= top + bottom
			insetRect.size.width -= left + right
			return insetRect
		#else
            return rect.inset(by: self)
		#endif
	}
}
