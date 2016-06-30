//
//  CGRect.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation
import CoreGraphics

#if os(OSX)
	public func NSStringFromCGRect(rect: CGRect) -> String! {
		return NSStringFromRect(rect)
	}

	public func CGRectFromString(string: String!) -> CGRect {
		return NSRectFromString(string) as CGRect
	}
#else
	import UIKit
#endif


extension CGRect {
	public var stringRepresentation: String {
		return NSStringFromCGRect(self)
	}

	public init(string: String) {
		self = CGRectFromString(string)
	}

	public func aspectFit(boundingRect: CGRect) -> CGRect {
		let size = self.size.aspectFit(boundingRect.size)
		var origin = boundingRect.origin
		origin.x += (boundingRect.size.width - size.width) / 2.0
		origin.y += (boundingRect.size.height - size.height) / 2.0
		return CGRect(origin: origin, size: size)
	}

	func aspectFill(minimumRect: CGRect) -> CGRect {
		let size = self.size.aspectFill(minimumRect.size)
		return CGRect(
			x: (minimumRect.size.width - size.width) / 2.0,
			y: (minimumRect.size.height - size.height) / 2.0,
			width: size.width,
			height: size.height
		)
	}

	public func apply(contentMode contentMode: ContentMode, bounds: CGRect) -> CGRect {
		var rect = self
		switch contentMode {
		case .ScaleToFill:
			return bounds
		case .ScaleAspectFit:
			return aspectFit(bounds)
		case .ScaleAspectFill:
			return aspectFill(bounds)
		case .Redraw:
			return rect
		case .Center:
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0
			return rect
		case .Top:
			rect.origin.y = 0
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0
			return rect
		case .Bottom:
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0
			rect.origin.y = bounds.size.height - rect.size.height
			return rect
		case .Left:
			rect.origin.x = 0
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0
			return rect
		case .Right:
			rect.origin.x = bounds.size.width - rect.size.width
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0
			return rect
		case .TopLeft:
			rect.origin = CGPointZero
			return rect
		case .TopRight:
			rect.origin.x = bounds.size.width - rect.size.width
			rect.origin.y = 0
			return rect
		case .BottomLeft:
			rect.origin.x = 0
			rect.origin.y = bounds.size.height - rect.size.height
			return rect
		case .BottomRight:
			rect.origin.x = bounds.size.width - rect.size.width
			rect.origin.y = bounds.size.height - rect.size.height
			return rect
		}
	}
}
