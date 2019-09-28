#if os(macOS)
	import AppKit.NSImage
	public typealias Image = NSImage

	extension Image {
		public var cgImage: CGImage! {
			return cgImage(forProposedRect: nil, context: nil, hints: nil)
		}

		// Optional to match UIImage
		public convenience init?(cgImage: CGImage) {
			self.init(cgImage: cgImage, size: .zero)
		}
	}
#else
	import UIKit.UIImage
	public typealias Image = UIImage
#endif

#if os(iOS) || os(tvOS)
extension Image {
	public convenience init?(named name: String, in bundle: Bundle?) {
		self.init(named: name, in: bundle, compatibleWith: nil)
	}
}
#endif // OS X verison implemented in Objective-C. watchOS version isn’t possible. 😭
