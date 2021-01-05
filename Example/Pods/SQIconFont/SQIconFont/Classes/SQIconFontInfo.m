//
//  SQIconFontInfo.m
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import "SQIconFontInfo.h"

@implementation SQIconFontInfo

- (instancetype)initIconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor iconInsets:(UIEdgeInsets)iconInsets iconBackgroundColor:(UIColor *)iconBgColor {
    if (self = [super init]) {
        self.iconName = iconName;
        self.iconSize = iconSize;
        self.iconColor = iconColor;
        self.iconInsets = iconInsets;
        self.iconBgColor = iconBgColor;
    }
    return self;
}

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor {
    return [[SQIconFontInfo alloc] initIconInfoWithIconName:iconName iconSize:iconSize iconColor:iconColor iconInsets:UIEdgeInsetsZero iconBackgroundColor:nil];
}

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor iconInsets:(UIEdgeInsets)iconInsets iconBackgroundColor:(UIColor *)iconBgColor {
    return [[SQIconFontInfo alloc] initIconInfoWithIconName:iconName iconSize:iconSize iconColor:iconColor iconInsets:UIEdgeInsetsZero iconBackgroundColor:nil];
}
@end
