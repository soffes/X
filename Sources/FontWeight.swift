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
			case .ultraLight: return UIFont.Weight.ultraLight.rawValue
			case .thin: return UIFont.Weight.thin.rawValue
			case .light: return UIFont.Weight.light.rawValue
			case .regular: return UIFont.Weight.regular.rawValue
			case .medium: return UIFont.Weight.medium.rawValue
			case .semibold: return UIFont.Weight.semibold.rawValue
			case .bold: return UIFont.Weight.bold.rawValue
			case .heavy: return UIFont.Weight.heavy.rawValue
			case .black: return UIFont.Weight.black.rawValue
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
			return Font.systemFont(ofSize: fontSize, weight: UIFont.Weight(rawValue: weight.weight))
		#else
			var descriptor = NSFont.systemFont(ofSize: fontSize).fontDescriptor
			descriptor = descriptor.addingAttributes([
				NSFontDescriptor.AttributeName.traits: [
					NSFontDescriptor.TraitKey.weight: weight.weight
				]
			])
			return NSFont(descriptor: descriptor, size: fontSize)!
		#endif
	}
}
