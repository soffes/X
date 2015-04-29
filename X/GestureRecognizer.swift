//
//  GestureRecognizer.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS)
	import UIKit.UIGestureRecognizer
	public typealias GestureRecognizerState = UIGestureRecognizerState
#else
	import AppKit.NSGestureRecognizer
	public typealias GestureRecognizerState = NSGestureRecognizerState
#endif
