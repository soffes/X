//
//  GestureRecognizer.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit
	@available(OSX 10.10, *) public typealias GestureRecognizerStateType = NSGestureRecognizerState
	@available(OSX 10.10, *) public typealias GestureRecognizerState = GestureRecognizerStateType
#else
	import UIKit.UIGestureRecognizer
	public typealias GestureRecognizerStateType = UIGestureRecognizerState
	public typealias GestureRecognizerState = GestureRecognizerStateType
#endif
