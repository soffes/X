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
        public static func named(_ name: String, in bundle: Bundle?) -> Image? {
            return Image(named: name, in: bundle, compatibleWith: nil)
        }
    }
#elseif os(macOS)
    extension Image {
        public static func named(_ name: String, in bundle: Bundle?) -> Image? {
            guard let bundle = bundle else {
                return Image(named: name)
            }

            guard let image = bundle.image(forResource: name) else {
                return nil
            }

            image.setName(name)
            return image
        }
    }
#endif
