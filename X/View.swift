//
//  View.swift
//  X
//
//  Created by Sam Soffes on 5/1/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS)
	import UIKit.UIView
	public typealias ViewType = UIView
#else
	import AppKit.NSView
	public typealias ViewType = NSView
#endif


public class View: ViewType {
	#if os(iOS)
		public var wantsLayer: Bool {
			set {
				// Do nothing
			}

			get {
				return true
			}
		}
	#else
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
	#endif
}
