//
//  FontWeight.swift
//  X
//
//  Created by Sam Soffes on 8/26/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
	import UIKit
#elseif os(OSX)
	import CoreGraphics
#endif

public enum FontWeight {
	case ultraLight
	case thin
	case light
	case regular
	case medium
	case semibold
	case bold
	case heavy
	case black

	#if os(iOS) || os(tvOS) || os(watchOS)
		public var weight: CGFloat {
			switch self {
			case .ultraLight: return UIFontWeightUltraLight
			case .thin: return UIFontWeightThin
			case .light: return UIFontWeightLight
			case .regular: return UIFontWeightRegular
			case .medium: return UIFontWeightMedium
			case .semibold: return UIFontWeightSemibold
			case .bold: return UIFontWeightBold
			case .heavy: return UIFontWeightHeavy
			case .black: return UIFontWeightBlack
			}
		}
	#else
		public var weight: CGFloat {
			switch self {
			case .ultraLight: return -0.8
			case .thin: return -0.6
			case .light: return -0.4
			case .regular: return 0.0
			case .medium: return 0.23
			case .semibold: return 0.3
			case .bold: return 0.4
			case .heavy: return 0.56
			case .black: return 0.62
			}
		}
	#endif
}


extension FontWeight: CustomStringConvertible {
	public var description: String {
		switch self {
		case .ultraLight: return "UltraLight"
		case .thin: return "Thin"
		case .light: return "Light"
		case .regular: return "Regular"
		case .medium: return "Medium"
		case .semibold: return "Semibold"
		case .bold: return "Bold"
		case .heavy: return "Heavy"
		case .black: return "Black"
		}
	}
}


extension Font {
	public static func systemFontOfSize(_ fontSize: CGFloat, weight: FontWeight) -> Font {
		#if os(iOS) || os(tvOS) || os(watchOS)
			return Font.systemFont(ofSize: fontSize, weight: weight.weight)
		#else
			var descriptor = NSFont.systemFont(ofSize: fontSize).fontDescriptor
			descriptor = descriptor.addingAttributes([
				NSFontTraitsAttribute: [
					NSFontWeightTrait: weight.weight
				]
			])
			return NSFont(descriptor: descriptor, size: fontSize)!
		#endif
	}
}
