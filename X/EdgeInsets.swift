//
//  EdgeInsets.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(watchOS)
	import UIKit
	public typealias EdgeInsets = UIEdgeInsets
#else
	import AppKit
	public typealias EdgeInsets = NSEdgeInsets
#endif


public let EdgeInsetsZero = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)


extension EdgeInsets {
	public static var zeroInsets: EdgeInsets {
		return EdgeInsetsZero
	}

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
				return CGRectNull
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
