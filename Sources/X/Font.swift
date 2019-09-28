#if os(macOS)
	import AppKit.NSFont
	public typealias Font = NSFont

	extension Font {
		public var symbolicTraits: FontDescriptorSymbolicTraits {
			return FontDescriptorSymbolicTraits(symbolicTraits: fontDescriptor.symbolicTraits.rawValue)
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
		#if os(macOS)
			let fontDescriptor = self.fontDescriptor.addingAttributes([
				NSFontDescriptor.AttributeName.featureSettings: [
					[
						NSFontDescriptor.FeatureKey.typeIdentifier: kNumberSpacingType,
						NSFontDescriptor.FeatureKey.selectorIdentifier: kMonospacedNumbersSelector
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize) ?? self
		#elseif os(watchOS)
			let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
				UIFontDescriptor.AttributeName.featureSettings: [
					[
						UIFontDescriptor.FeatureKey.featureIdentifier: 6,
						UIFontDescriptor.FeatureKey.typeIdentifier: 0
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize)
		#else
			let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
				UIFontDescriptor.AttributeName.featureSettings: [
					[
						UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
						UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize)
		#endif
	}
}
