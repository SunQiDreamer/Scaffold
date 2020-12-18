//
//  UIFont+Addition.h
//  MainSearch
//
//  Created by 孙琦 on 2020/2/9.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kSystemFont10 [UIFont pingFangRegularFontOfSize:CGFloatScale(10)]
#define kSystemFont11 [UIFont pingFangRegularFontOfSize:CGFloatScale(11)]
#define kSystemFont12 [UIFont pingFangRegularFontOfSize:CGFloatScale(12)]
#define kSystemFont13 [UIFont pingFangRegularFontOfSize:CGFloatScale(13)]
#define kSystemFont14 [UIFont pingFangRegularFontOfSize:CGFloatScale(14)]
#define kSystemFont15 [UIFont pingFangRegularFontOfSize:CGFloatScale(15)]
#define kSystemFont16 [UIFont pingFangRegularFontOfSize:CGFloatScale(16)]
#define kSystemFont18 [UIFont pingFangRegularFontOfSize:CGFloatScale(18)]
#define kSystemFont20 [UIFont pingFangRegularFontOfSize:CGFloatScale(20)]

#define KSemiboldFont10 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(10)]
#define KSemiboldFont14 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(14)]
#define KSemiboldFont16 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(16)]
#define KSemiboldFont18 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(18)]
#define KSemiboldFont20 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(20)]
#define KSemiboldFont22 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(22)]
#define KSemiboldFont24 [UIFont pingFangSemiboldFontOfSize:CGFloatScale(24)]


#define KMediumFont10 [UIFont pingFangMediumFontOfSize:CGFloatScale(10)]
#define KMediumFont11 [UIFont pingFangMediumFontOfSize:CGFloatScale(11)]
#define KMediumFont12 [UIFont pingFangMediumFontOfSize:CGFloatScale(12)]
#define KMediumFont13 [UIFont pingFangMediumFontOfSize:CGFloatScale(13)]
#define KMediumFont14 [UIFont pingFangMediumFontOfSize:CGFloatScale(14)]
#define KMediumFont16 [UIFont pingFangMediumFontOfSize:CGFloatScale(16)]
#define KMediumFont18 [UIFont pingFangMediumFontOfSize:CGFloatScale(18)]
#define KMediumFont20 [UIFont pingFangMediumFontOfSize:CGFloatScale(20)]
#define KMediumFont22 [UIFont pingFangMediumFontOfSize:CGFloatScale(22)]


#define kBoldFont14 [UIFont pingFangBoldFontOfSize:CGFloatScale(14)]
#define kBoldFont16 [UIFont pingFangBoldFontOfSize:CGFloatScale(16)]
#define kBoldFont17 [UIFont pingFangBoldFontOfSize:CGFloatScale(17)]
#define kBoldFont18 [UIFont pingFangBoldFontOfSize:CGFloatScale(18)]
#define kBoldFont20 [UIFont pingFangBoldFontOfSize:CGFloatScale(20)]

#define KBoldDINProFont12 [UIFont boldDINProFontOfSize:CGFloatScale(12)]
#define KBoldDINProFont13 [UIFont boldDINProFontOfSize:CGFloatScale(13)]
#define KBoldDINProFont14 [UIFont boldDINProFontOfSize:CGFloatScale(14)]
#define KBoldDINProFont18 [UIFont boldDINProFontOfSize:CGFloatScale(18)]
#define KBoldDINProFont20 [UIFont boldDINProFontOfSize:CGFloatScale(20)]
#define KBoldDINProFont32 [UIFont boldDINProFontOfSize:CGFloatScale(32)]


#define KMediumDINProFont14 [UIFont mediumDINProFontOfSize:CGFloatScale(14)]

#define KRegularDINProFont14 [UIFont regularDINProFontOfSize:CGFloatScale(14)]

#define KIconFont6 [UIFont iconFontOfSize:CGFloatScale(6)]
#define KIconFont8 [UIFont iconFontOfSize:CGFloatScale(8)]
#define KIconFont12 [UIFont iconFontOfSize:CGFloatScale(12)]
#define KIconFont14 [UIFont iconFontOfSize:CGFloatScale(14)]
#define KIconFont20 [UIFont iconFontOfSize:CGFloatScale(20)]
#define KIconFont30 [UIFont iconFontOfSize:CGFloatScale(30)]
#define KIconFont32 [UIFont iconFontOfSize:CGFloatScale(32)]


@interface UIFont (Addition)

+ (UIFont *)semiboldSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)mediumSystemFontOfSize:(CGFloat)fontSize;


+ (UIFont *)regularDINProFontOfSize:(CGFloat)fontSize;

+ (UIFont *)boldDINProFontOfSize:(CGFloat)fontSize;

+ (UIFont *)mediumDINProFontOfSize:(CGFloat)fontSize;

+ (UIFont *)italicDINProFontOfSize:(CGFloat)fontSize;


+ (UIFont *)pingFangRegularFontOfSize:(CGFloat)fontSize;

+ (UIFont *)pingFangSemiboldFontOfSize:(CGFloat)fontSize;

+ (UIFont *)pingFangMediumFontOfSize:(CGFloat)fontSize;

+ (UIFont *)pingFangBoldFontOfSize:(CGFloat)fontSize;

+ (UIFont *)iconFontOfSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
