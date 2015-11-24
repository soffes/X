//
//  Font.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSFont
	public typealias FontType = NSFont
#else
	import UIKit.UIFont
	public typealias FontType = UIFont
#endif

public typealias Font = FontType
