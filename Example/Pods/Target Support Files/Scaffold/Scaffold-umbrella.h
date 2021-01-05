#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIApplication+Addition.h"
#import "UIColor+Addition.h"
#import "UIFont+Addition.h"
#import "UINavigationController+Addition.h"
#import "CommonHeader.h"
#import "GQAnimationRefreshHeader.h"

FOUNDATION_EXPORT double ScaffoldVersionNumber;
FOUNDATION_EXPORT const unsigned char ScaffoldVersionString[];

