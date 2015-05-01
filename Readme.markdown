# X

Easier *cross* platform Mac and iOS development with Swift. X was abstracted out of [Redacted](http://useredacted.com) and [Whiskey](http://usewhiskey.com).

This is a work in progress.

## Installation

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Version](https://img.shields.io/github/release/soffes/x.svg)](https://github.com/soffes/X/releases)

[Carthage](https://github.com/carthage/carthage) is the recommended way to install X. Add the following to your Cartfile:

``` ruby
github "soffes/X"
```

## Usage

X provides several `typealias`es to make dealing with AppKit/UIKit types that are similar. Currently, X includes:

| Name                                                    | UIKit                    | AppKit                   |
|---------------------------------------------------------|--------------------------|--------------------------|
| [ColorType](X/Color.swift)                              | UIColor                  | NSColor                  |
| [FontType](X/Font.swift)                                | UIFont                   | NSFont                   |
| [GestureRecognizerStateType](X/GestureRecognizer.swift) | UIGestureRecognizerState | NSGestureRecognizerState |
| [ImageType](X/Image.swift)                              | UIImage                  | NSImage                  |
| [ScreenType](X/Screen.swift)                            | UIView                   | NSView                   |
| [ViewType](X/View.swift)                                | UIView                   | NSView                   |

Note that all of these types end in `Type`. This is consistent with the Swift standard library. There's also a type alias for all of these that omit the type like this:

``` swift
public typealias Color = ColorType
```

This is handy because X can choose to later provide a subclass if some desired functionality isn't possible via `extension`. This is the case for `View` (see below).

If you wanted to use a color on both platforms, you could write something like this:

``` swift
let blueColor = Color(red:0.298, green:0.757, blue:0.988, alpha: 1.0)
```

Note we use `Color` instead of `ColorType` since we are initializing one. If we were using it as a type, we should use `ColorType`. Here's an example:

``` swift
func changeColor(color: ColorType) {
    // Do something
}
```


### View

[`View`](X/View.swift) inherits from `ViewType` (so either `UIView` or `NSView`) and adds some platform specific functionality. This makes methods like `layoutSubviews` work on both platforms. The UIKit API is cleaner, so NSView has methods added in `View` to make it behave more like `UIView`.

Here's the current list of bridged methods that work on both:

``` swift
var wantsLayer: Bool      // On iOS, this doesn't do anything and always returns `true`.
func didMoveToWindow()    // Bridged from `viewDidMoveToWindow`
func didMoveToSuperview() // Bridged from `didMoveToSuperview`
func layoutSubviews()     // Bridged from `layout`
```

Enjoy.
