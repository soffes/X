//
//  Font.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS)
	import UIKit.UIFont
	public typealias Font = UIFont
#else
	import AppKit.NSFont
	public typealias Font = NSFont
#endif
