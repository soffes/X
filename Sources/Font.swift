//
//  Font.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSFont
	public typealias Font = NSFont

	extension Font {
		public var symbolicTraits: FontDescriptorSymbolicTraits {
			return FontDescriptorSymbolicTraits(symbolicTraits: fontDescriptor.symbolicTraits)
		}
	}
#else
	import UIKit.UIFont
	public typealias Font = UIFont

	extension Font {
		public var symbolicTraits: FontDescriptorSymbolicTraits {
			return fontDescriptor.symbolicTraits
		}
	}
#endif


extension Font {
	public var fontWithMonospacedNumbers: Font {
		#if os(OSX)
			let fontDescriptor = self.fontDescriptor.addingAttributes([
				NSFontFeatureSettingsAttribute: [
					[
						NSFontFeatureTypeIdentifierKey: kNumberSpacingType,
						NSFontFeatureSelectorIdentifierKey: kMonospacedNumbersSelector
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize) ?? self
		#elseif os(watchOS)
			let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
				UIFontDescriptorFeatureSettingsAttribute: [
					[
						UIFontFeatureTypeIdentifierKey: 6,
						UIFontFeatureSelectorIdentifierKey: 0
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize)
		#else
			let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
				UIFontDescriptorFeatureSettingsAttribute: [
					[
						UIFontFeatureTypeIdentifierKey: kNumberSpacingType,
						UIFontFeatureSelectorIdentifierKey: kMonospacedNumbersSelector
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize)
		#endif
	}
}
