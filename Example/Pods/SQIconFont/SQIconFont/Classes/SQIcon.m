//
//  SQIcon.m
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import "SQIcon.h"
#import "SQIconFontConfig.h"
#import "SQIconFontInfo.h"
#import "UIImage+iconFont.h"

@implementation SQIcon

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor {
    return [self iconWithName:iconName size:iconSize color:iconColor insets:UIEdgeInsetsZero backgroundColor:nil];
}

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets {
    return [self iconWithName:iconName size:iconSize color:iconColor insets:iconInsets backgroundColor:nil];
}

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor backgroundColor:(UIColor *)iconBgColor {
    return [self iconWithName:iconName size:iconSize color:iconColor insets:UIEdgeInsetsZero backgroundColor:iconBgColor];
}

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets backgroundColor:(UIColor *)iconBgColor {
    NSString *fontUnicode = [self matchIconCodeWithName:iconName];
    SQIconFontInfo *fontInfo = [SQIconFontInfo iconInfoWithIconName:fontUnicode iconSize:iconSize iconColor:iconColor iconInsets:iconInsets iconBackgroundColor:iconBgColor];
    NSString *fontname = SQIconFontConfig.shareInstance.fontName;
    fontInfo.fontName = fontname;
    return [UIImage imageWithIconInfo:fontInfo];
}

+ (NSString *)matchIconCodeWithName:(NSString *)iconName {
    NSDictionary *fontDic = SQIconFontConfig.shareInstance.map;
    NSString *code = fontDic[iconName];
    return code ? : iconName;
}
@end
