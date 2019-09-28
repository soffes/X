# X

[![Version](https://img.shields.io/github/release/soffes/x.svg)](https://github.com/soffes/X/releases)
![Swift Version](https://img.shields.io/badge/swift-5.1-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Easier *cross* platform Mac and iOS development with Swift 5.1. X was abstracted out of [Redacted](http://useredacted.com) and [Whiskey](http://usewhiskey.com).

Xcode 11.1 or higher is required.


## Installation

[Carthage](https://github.com/carthage/carthage) is the recommended way to install X. Add the following to your Cartfile:

``` ruby
github "soffes/X"
```

## Usage

X provides several `typealias`es to make dealing with AppKit/UIKit types that are similar. Currently, X includes:

| Name                                                      | UIKit                      | AppKit                     |
|-----------------------------------------------------------|----------------------------|----------------------------|
| [`Color`](X/Color.swift)                                  | `UIColor`                  | `NSColor`                  |
| [`ContentMode`](X/ContentMode.swift)                      | `UIViewContentMode`        |  N/A                        |
| [`EdgeInsets`](X/EdgeInsets.swift)                        | `UIEdgeInsets`             | `NSEdgeInsets`             |
| [`Font`](X/Font.swift)                                    | `UIFont`                   | `NSFont`                   |
| [`GestureRecognizerStateType`](X/GestureRecognizer.swift) | `UIGestureRecognizerState` | `NSGestureRecognizerState` |
| [`Image`](X/Image.swift)                                  | `UIImage`                  | `NSImage`                  |
| [`Screen`](X/Screen.swift)                                | `UIScreen`                 | `NSScreen`                 |
| [`ViewType`](X/View.swift)                                | `UIView`                   | `NSView`                   |


If you wanted to use a color on both platforms, you could write something like this:

``` swift
let blueColor = Color(red:0.298, green:0.757, blue:0.988, alpha: 1.0)
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

### Core Graphics

There are several extensions for [`CGPoint`](X/CGPoint.swift), [`CGSize`](X/CGSize.swift), and [`CGRect`](X/CGRect.swift) that help with converting to and from strings since UIKit and AppKit have different function names. The UIKit function names are aliased on Mac. There are also initializers and computed properties you can use instead of the functions.

Enjoy.
