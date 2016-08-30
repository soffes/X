//
//  FontDescriptorSymbolicTraits.swift
//  X
//
//  Created by Sam Soffes on 8/26/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import Foundation

#if os(OSX)
	public struct FontDescriptorSymbolicTraits: OptionSet {
		public let rawValue: Int32

		public init(rawValue: Int32) {
			self.rawValue = rawValue
		}

		public init(rawValue: Int) {
			self.rawValue = Int32(rawValue)
		}

		public init(symbolicTraits: NSFontSymbolicTraits) {
			var traits = FontDescriptorSymbolicTraits()

			if symbolicTraits & UInt32(NSFontItalicTrait) == UInt32(NSFontItalicTrait) {
				traits.insert(.TraitItalic)
			}

			if symbolicTraits & UInt32(NSFontBoldTrait) == UInt32(NSFontBoldTrait) {
				traits.insert(.TraitBold)
			}

			if symbolicTraits & UInt32(NSFontExpandedTrait) == UInt32(NSFontExpandedTrait) {
				traits.insert(.TraitExpanded)
			}

			if symbolicTraits & UInt32(NSFontCondensedTrait) == UInt32(NSFontCondensedTrait) {
				traits.insert(.TraitCondensed)
			}

			if symbolicTraits & UInt32(NSFontMonoSpaceTrait) == UInt32(NSFontMonoSpaceTrait) {
				traits.insert(.TraitMonoSpace)
			}

			if symbolicTraits & UInt32(NSFontVerticalTrait) == UInt32(NSFontVerticalTrait) {
				traits.insert(.TraitVertical)
			}

			if symbolicTraits & UInt32(NSFontUIOptimizedTrait) == UInt32(NSFontUIOptimizedTrait) {
				traits.insert(.TraitUIOptimized)
			}

			self = traits
		}

		public static let TraitItalic = FontDescriptorSymbolicTraits(rawValue: NSFontItalicTrait)
		public static let TraitBold = FontDescriptorSymbolicTraits(rawValue: NSFontBoldTrait)
		public static let TraitExpanded = FontDescriptorSymbolicTraits(rawValue: NSFontExpandedTrait)
		public static let TraitCondensed = FontDescriptorSymbolicTraits(rawValue: NSFontCondensedTrait)
		public static let TraitMonoSpace = FontDescriptorSymbolicTraits(rawValue: NSFontMonoSpaceTrait)
		public static let TraitVertical = FontDescriptorSymbolicTraits(rawValue: NSFontVerticalTrait)
		public static let TraitUIOptimized = FontDescriptorSymbolicTraits(rawValue: NSFontUIOptimizedTrait)

		public var symbolicTraits: NSFontSymbolicTraits {
			var symbolicTraits: NSFontSymbolicTraits = 0

			if contains(.TraitItalic) {
				symbolicTraits ^= UInt32(NSFontItalicTrait)
			}

			if contains(.TraitBold) {
				symbolicTraits ^= UInt32(NSFontBoldTrait)
			}

			if contains(.TraitExpanded) {
				symbolicTraits ^= UInt32(NSFontExpandedTrait)
			}

			if contains(.TraitCondensed) {
				symbolicTraits ^= UInt32(NSFontCondensedTrait)
			}

			if contains(.TraitMonoSpace) {
				symbolicTraits ^= UInt32(NSFontMonoSpaceTrait)
			}

			if contains(.TraitVertical) {
				symbolicTraits ^= UInt32(NSFontVerticalTrait)
			}

			if contains(.TraitUIOptimized) {
				symbolicTraits ^= UInt32(NSFontUIOptimizedTrait)
			}

			return symbolicTraits
		}
	}
#else
	import UIKit
	public typealias FontDescriptorSymbolicTraits = UIFontDescriptorSymbolicTraits
#endif
