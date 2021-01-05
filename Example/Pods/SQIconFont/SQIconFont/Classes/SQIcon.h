//
//  SQIcon.h
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kIconName(name) [SQIcon matchIconCodeWithName: name]

@interface SQIcon : NSObject

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:( UIColor *)iconColor;

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets;

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor backgroundColor:(nullable UIColor *)iconBgColor;

+ (UIImage *)iconWithName:(NSString *)iconName size:(CGFloat)iconSize color:(UIColor *)iconColor insets:(UIEdgeInsets)iconInsets backgroundColor:(nullable UIColor *)iconBgColor;

+ (NSString *)matchIconCodeWithName:(NSString *)iconName;
@end

NS_ASSUME_NONNULL_END
