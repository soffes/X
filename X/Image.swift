//
//  Image.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSImage
	public typealias Image = NSImage

	extension NSImage {
		public var CGImage: CGImageRef! {
			return CGImageForProposedRect(nil, context: nil, hints: nil)
		}

		// Optional to match UIImage
		public convenience init?(CGImage cgImage: CGImageRef) {
			self.init(CGImage: cgImage, size: CGSizeZero)
		}
	}
#else
	import UIKit.UIImage
	public typealias Image = UIImage
#endif

#if os(iOS) || os(tvOS)
extension Image {
	public convenience init?(named name: String, inBundle bundle: NSBundle?) {
		self.init(named: name, inBundle: bundle, compatibleWithTraitCollection: nil)
	}
}
#endif // OS X verison implemented in Objective-C. watchOS version isn’t possible. 😭
