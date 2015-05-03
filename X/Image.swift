//
//  Image.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS)
	import UIKit.UIImage
	public typealias ImageType = UIImage
 #else
	import AppKit.NSImage
	public typealias ImageType = NSImage

	extension NSImage {
		public var CGImage: CGImageRef! {
			return CGImageForProposedRect(nil, context: nil, hints: nil)?.takeUnretainedValue()
		}

		// Optional to match UIImage
		public convenience init?(CGImage cgImage: CGImageRef) {
			self.init(CGImage: cgImage, size: CGSizeZero)
		}

		public convenience init?(named name: String, inBundle bundle: NSBundle?) {
			#if os(iOS)
				self.init(named: name, inBundle: bundle, compatibleWithTraitCollection: nil)
			#else
				let b = bundle ?? NSBundle.mainBundle()
				let path = b.pathForImageResource(name) ?? ""
				self.init(contentsOfFile: path)
			#endif
		}
	}
 #endif

public typealias Image = ImageType
