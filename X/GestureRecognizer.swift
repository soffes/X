//
//  GestureRecognizer.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit
	@available(OSX 10.10, *) public typealias GestureRecognizerState = NSGestureRecognizerState
	@available(OSX 10.10, *) public typealias TapGestureRecognizer = NSClickGestureRecognizer
#else
	import UIKit.UIGestureRecognizer
	public typealias GestureRecognizerState = UIGestureRecognizerState
	public typealias TapGestureRecognizer = UITapGestureRecognizer
#endif
