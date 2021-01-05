//
//  UIColor+Addition.m
//  MainSearch
//
//  Created by 孙琦 on 2020/2/8.
//  Copyright © 2020 sunqi. All rights reserved.
//

#import "UIColor+Addition.h"
#import "UIColor+YYAdd.h"

@implementation UIColor (Addition)

+ (UIColor *)randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    
    UIColor *randColor = [UIColor colorWithRed:aRedValue /255.0f green:aGreenValue /255.0f blue:aBlueValue /255.0f alpha:1.0f];
    return randColor;
}

+ (UIColor *)mainThemeColor {
    return UIColorHex(0x175CE6);
}

+ (UIColor *)stockUpColor {
    return kDynamicColorHex(0xE62E4D, 0xFF4D68);
}

+ (UIColor *)stockOrange {
    return UIColorHex(0xFF8126);;
}

+ (UIColor *)stockDownColor {
    return kDynamicColorHex(0x1F995C, 0x4CD992);
}

+ (UIColor *)stockNormalColor {
    return UIColor.textMainColor;
}

+ (UIColor *)textMainColor {
    return kDynamicColorHex(0x222222, 0xCCCCCC);
}

+ (UIColor *)textGray2Color {
    return kDynamicColorHex(0xAAAAAA, 0x666666);
}

+ (UIColor *)textGray3Color {
    return kDynamicColorHex(0x666666, 0xAAAAAA);
}

+ (UIColor *)textGray4Color {
    return kDynamicColorHex(0xCCCCCC, 0x666666);
}

+ (UIColor *)textGray5Color {
    return kDynamicColorHex(0x888888, 0xAAAAAA);
}

+ (UIColor *)textBlueColor {
    return kDynamicColorHex(0x175CE6, 0x4D88FF);
}

+ (UIColor *)textRedColor {
    return UIColor.stockUpColor;
}

+ (UIColor *)bgMainColor {
    return kDynamicColorHex(0xFFFFFF, 0x17181A);
}

+ (UIColor *)bgGrayColor {
    return kDynamicColorHex(0xF2F3F5, 0x292B33);
}

+ (UIColor *)bgGray2Color {
    return kDynamicColorHex(0xEBEEF5, 0x000000);
}

+ (UIColor *)bgGray3Color {
    return kDynamicColorHex(0xEBF1FF, 0x000000);
}

+ (UIColor *)bgBlueColor {
    return kDynamicColorHex(0x175CE6, 0x4D88FF);
}

+ (UIColor *)lineColor {
    return kDynamicColorHex(0xE6E6E6, 0x050505);
}

+ (UIColor *)line2Color {
    return kDynamicColorHex(0xF0F0F0, 0x050505);
}

+ (UIColor *)maskColor {
    return [UIColor colorWithRGB:0x000000 alpha:0.5];
}

+ (UIColor *)vipColor {
    return UIColorHex(0xFFB266);
}

+ (UIColor *)CCCColor {
    return UIColorHex(0xCCCCCC);
}

+ (UIColor *)dynamicColorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkColor;
            } else {
                return lightColor;
            }
        }];
    } else {
        return lightColor;
    }
}

+ (UIColor *)dynamicColorWithLightColorHex:(NSString *)lightColorHex darkColorHex:(NSString *)darkColorHex {
    if (@available(iOS 13.0, *)) {
        UIColor *darkColor = [UIColor colorWithHexString:darkColorHex];
        UIColor *lightColor = [UIColor colorWithHexString:lightColorHex];
        return [self dynamicColorWithLightColor:lightColor darkColor:darkColor];
    } else {
        return [UIColor colorWithHexString:lightColorHex];
    }
}

@end
