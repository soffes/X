//
//  Image+macOS.h
//  X
//
//  Created by Sam Soffes on 5/3/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import AppKit.NSImage;

@interface NSImage (X)

+ (nullable instancetype)imageNamed:(nonnull NSString *)name in:(nullable NSBundle *)bundle;

@end
