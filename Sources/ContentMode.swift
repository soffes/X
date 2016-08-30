//
//  ContentMode.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX) || os(watchOS)
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
	public typealias ContentMode = UIViewContentMode
#endif
