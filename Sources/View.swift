//
//  View.swift
//  X
//
//  Created by Sam Soffes on 5/1/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSView
	public typealias ViewType = NSView
#else
	import UIKit.UIView
	public typealias ViewType = UIView
#endif


open class View: ViewType {
	#if os(OSX)
		open var userInteractionEnabled: Bool {
			return true
		}
	
		open override func viewDidMoveToWindow() {
			didMoveToWindow()
		}

		open func didMoveToWindow() {
			super.viewDidMoveToWindow()
		}

		open override func viewDidMoveToSuperview() {
			didMoveToSuperview()
		}

		open func didMoveToSuperview() {
			super.viewDidMoveToSuperview()
		}

		open override func layout() {
			layoutSubviews()
		}

		open func layoutSubviews() {
			super.layout()
		}
	#else
		open var wantsLayer: Bool {
			set {
				// Do nothing
			}

			get {
				return true
			}
		}
	#endif
}
