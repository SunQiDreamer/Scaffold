//
//  SQIconFontInfo.h
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQIconFontInfo : NSObject

@property (nonatomic, copy) NSString *fontName;

@property (nonatomic, copy) NSString *iconName;

@property (nonatomic, assign) NSInteger iconSize;

@property (nonatomic, strong) UIColor *iconColor;

@property (nonatomic, strong) UIColor *iconBgColor;

@property (nonatomic, assign) UIEdgeInsets iconInsets;

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor;

+ (instancetype)iconInfoWithIconName:(NSString *)iconName iconSize:(NSInteger)iconSize iconColor:(UIColor *)iconColor iconInsets:(UIEdgeInsets)iconInsets iconBackgroundColor:(UIColor *)iconBgColor;
@end

NS_ASSUME_NONNULL_END
