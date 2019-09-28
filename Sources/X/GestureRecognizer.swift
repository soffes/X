#if os(iOS) || os(tvOS)
    import UIKit.UIGestureRecognizer
    public typealias GestureRecognizer = UIGestureRecognizer
    public typealias TapGestureRecognizer = UITapGestureRecognizer
#elseif os(macOS)
    import AppKit.NSGestureRecognizer
    @available(OSX 10.10, *) public typealias GestureRecognizer = NSGestureRecognizer
    @available(OSX 10.10, *) public typealias TapGestureRecognizer = NSClickGestureRecognizer
#endif
