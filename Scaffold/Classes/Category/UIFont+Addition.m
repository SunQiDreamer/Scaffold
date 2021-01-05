//
//  UIFont+Addition.m
//  MainSearch
//
//  Created by 孙琦 on 2020/2/9.
//  Copyright © 2020 sunqi. All rights reserved.
//

#import "UIFont+Addition.h"

@implementation UIFont (Addition)

+ (UIFont *)semiboldSystemFontOfSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightSemibold];
}

+ (UIFont *)mediumSystemFontOfSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium];
}

+ (UIFont *)boldDINProFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DINPro-Bold" size:fontSize];
}

+ (UIFont *)mediumDINProFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DINPro-Medium" size:fontSize];
}

+ (UIFont *)italicDINProFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DIN-BlackItalicAlt" size:fontSize];
}

+ (UIFont *)regularDINProFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DINPro-Regular" size:fontSize];
}


+ (UIFont *)pingFangRegularFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}

+ (UIFont *)pingFangSemiboldFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
}

+ (UIFont *)pingFangMediumFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}

+ (UIFont *)pingFangBoldFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangTC-Semibold" size:fontSize];
}

+ (UIFont *)iconFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"iconfont" size:fontSize];
}

@end
