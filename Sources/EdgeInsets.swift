//
//  EdgeInsets.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit
#else
	import UIKit
	public typealias EdgeInsets = UIEdgeInsets
#endif


extension EdgeInsets {
	public var flipped: EdgeInsets {
		var insets = self
		insets.top = bottom
		insets.bottom = top
		return insets
	}

	public func insetRect(rect: CGRect) -> CGRect {
		#if os(iOS) || os(watchOS)
			return UIEdgeInsetsInsetRect(rect, self)
		#else
			if (top + bottom > rect.size.height) || (left + right > rect.size.width) {
				return .null
			}

			var insetRect = rect
			insetRect.origin.x += left
			insetRect.origin.y += top;
			insetRect.size.height -= top + bottom
			insetRect.size.width -= left + right
			return insetRect
		#endif
	}
}
