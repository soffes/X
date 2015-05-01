//
//  CGRect.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

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
}
