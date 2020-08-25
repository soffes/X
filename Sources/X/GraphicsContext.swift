//
//  GraphicsContext.swift
//  X
//
//  Created by Jan on 20.08.20.
//  Copyright © 2020 Sam Soffes. All rights reserved.
//

#if os(macOS)
import AppKit.NSGraphicsContext
public typealias GraphicsContext = NSGraphicsContext
#else
import UIKit.UIGraphics
public typealias GraphicsContext = CGContext
#endif
