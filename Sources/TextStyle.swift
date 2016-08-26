//
//  TextStyle.swift
//  X
//
//  Created by Sam Soffes on 8/26/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
	import UIKit
#elseif os(OSX)
	import AppKit
#endif

public enum TextStyle {
	case title1
	case title2
	case title3
	case headline
	case subheadline
	case body
	case footnote
	case caption1
	case caption2
	case callout

	#if os(iOS) || os(tvOS) || os(watchOS)
		public var textStyle: String {
			switch self {
			case .title1: return UIFontTextStyleTitle1
			case .title2: return UIFontTextStyleTitle2
			case .title3: return UIFontTextStyleTitle3
			case .headline: return UIFontTextStyleHeadline
			case .subheadline: return UIFontTextStyleSubheadline
			case .body: return UIFontTextStyleBody
			case .footnote: return UIFontTextStyleFootnote
			case .caption1: return UIFontTextStyleCaption1
			case .caption2: return UIFontTextStyleCaption2
			case .callout: return UIFontTextStyleCallout
			}
		}
	#endif

	public var fontWeight: FontWeight {
		switch self {
		case .title1: return .light
		case .headline: return .semibold
		default: return .regular
		}
	}

	public var pointSize: CGFloat {
		switch self {
		case .title1: return 28
		case .title2: return 22
		case .title3: return 20
		case .headline: return 17
		case .subheadline: return 15
		case .body: return 17
		case .footnote: return 13
		case .caption1: return 12
		case .caption2: return 11
		case .callout: return 16
		}
	}
}


extension TextStyle: CustomStringConvertible {
	public var description: String {
		switch self {
		case .title1: return "Title1"
		case .title2: return "Title2"
		case .title3: return "Title3"
		case .headline: return "Headline"
		case .subheadline: return "Subheadline"
		case .body: return "Body"
		case .footnote: return "Footnote"
		case .caption1: return "Caption1"
		case .caption2: return "Caption2"
		case .callout: return "Callout"
		}
	}
}


extension Font {
	public static func preferredFontForTextStyle(textStyle: TextStyle) -> Font {
		#if os(iOS) || os(tvOS) || os(watchOS)
			return Font.preferredFontForTextStyle(textStyle.textStyle)
		#else
			var descriptor = NSFont.systemFontOfSize(textStyle.pointSize).fontDescriptor
			descriptor = descriptor.fontDescriptorByAddingAttributes([
				NSFontTraitsAttribute: [
					NSFontWeightTrait: textStyle.fontWeight.weight
				]
			])
			return NSFont(descriptor: descriptor, size: textStyle.pointSize)!
		#endif
	}
}
