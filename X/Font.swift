//
//  Font.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(watchOS)
	import UIKit.UIFont
	public typealias FontType = UIFont
#else
	import AppKit.NSFont
	public typealias FontType = NSFont
#endif

public typealias Font = FontType
