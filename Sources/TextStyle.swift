//
//  TextStyle.swift
//  X
//
//  Created by Sam Soffes on 8/26/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
	import UIKit
	public typealias FontTextStyle = UIFontTextStyle
#elseif os(OSX)
	import AppKit

	public enum FontTextStyle: String {
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


	extension Font {
		public static func preferredFont(textStyle: FontTextStyle) -> Font {
			return Font.systemFontOfSize(textStyle.pointSize, weight: textStyle.fontWeight)
		}
	}
#endif
