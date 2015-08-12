//
//  Image.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(watchOS)
	import UIKit.UIImage
	public typealias ImageType = UIImage
 #else
	import AppKit.NSImage
	public typealias ImageType = NSImage

	extension NSImage {
		public var CGImage: CGImageRef! {
			return CGImageForProposedRect(nil, context: nil, hints: nil)
		}

		// Optional to match UIImage
		public convenience init?(CGImage cgImage: CGImageRef) {
			self.init(CGImage: cgImage, size: CGSizeZero)
		}
	}
 #endif

public typealias Image = ImageType

#if os(iOS)
extension Image {
	public convenience init?(named name: String, inBundle bundle: NSBundle?) {
		self.init(named: name, inBundle: bundle, compatibleWithTraitCollection: nil)
	}
}
#endif // OS X verison implemented in Objective-C. watchOS version isn’t possible. 😭
