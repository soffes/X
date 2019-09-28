@import AppKit.NSImage;

@interface NSImage (X)

+ (nullable NSImage *)imageNamed:(nonnull NSString *)name inBundle:(nullable NSBundle *)bundle;

@end
