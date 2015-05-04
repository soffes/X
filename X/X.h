//
//  X.h
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

@import Foundation;

//! Project version number for X.
FOUNDATION_EXPORT double XVersionNumber;

//! Project version string for X.
FOUNDATION_EXPORT const unsigned char XVersionString[];

#if TARGET_OS_MAC
	#import <X/Image+Mac.h>
#endif
