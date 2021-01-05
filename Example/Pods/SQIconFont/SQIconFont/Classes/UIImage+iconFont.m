//
//  UIImage+SQIconFont.m
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import "UIImage+iconFont.h"
#import <CoreText/CoreText.h>
#import "SQIconFont.h"


@implementation UIImage (SQIconFont)

+ (UIImage *)imageWithIconInfo:(SQIconFontInfo *)iconInfo {
    CGFloat w1 = iconInfo.iconSize - iconInfo.iconInsets.left - iconInfo.iconInsets.right;
    CGFloat w2 = iconInfo.iconSize - iconInfo.iconInsets.top - iconInfo.iconInsets.bottom;
    CGFloat size = MIN(w1, w2);
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    CGFloat imageSize = iconInfo.iconSize * scale;
    UIFont *font = iconInfo.fontName ? [SQIconFont fontWithName:iconInfo.fontName size:realSize]: [SQIconFont fontWithSize:realSize];
    UIGraphicsBeginImageContext(CGSizeMake(imageSize, imageSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (iconInfo.iconBgColor) {
        [iconInfo.iconBgColor set];
        UIRectFill(CGRectMake(0.0, 0.0, imageSize, imageSize)); //fill the background
    }
    
    CGPoint point = CGPointMake(iconInfo.iconInsets.left * scale, iconInfo.iconInsets.top * scale);
    
    if ([iconInfo.iconName respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [iconInfo.iconName drawAtPoint:point withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: iconInfo.iconColor}];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, iconInfo.iconColor.CGColor);
        [iconInfo.iconName drawAtPoint:point withFont:font];
#pragma clang pop
    }
    
    // 绘制UIImage实例
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    return image;
}
@end
