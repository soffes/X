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


public class View: ViewType {
	#if os(OSX)
		public var userInteractionEnabled: Bool {
			return true
		}
	
		public override func viewDidMoveToWindow() {
			didMoveToWindow()
		}

		public func didMoveToWindow() {
			super.viewDidMoveToWindow()
		}

		public override func viewDidMoveToSuperview() {
			didMoveToSuperview()
		}

		public func didMoveToSuperview() {
			super.viewDidMoveToSuperview()
		}

		public override func layout() {
			layoutSubviews()
		}

		public func layoutSubviews() {
			super.layout()
		}
	#else
		public var wantsLayer: Bool {
			set {
				// Do nothing
			}

			get {
				return true
			}
		}
	#endif
}
