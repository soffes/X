#if os(macOS)
	import AppKit.NSGestureRecognizer
	@available(OSX 10.10, *) public typealias GestureRecognizer = NSGestureRecognizer
	@available(OSX 10.10, *) public typealias TapGestureRecognizer = NSClickGestureRecognizer
#else
	import UIKit.UIGestureRecognizer
	public typealias GestureRecognizer = UIGestureRecognizer
	public typealias TapGestureRecognizer = UITapGestureRecognizer

	extension GestureRecognizer {
        public typealias State = UIGestureRecognizer.State
	}
#endif
