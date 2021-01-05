//
//  UIImage+iconFont.h
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQIconFontInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (iconFont)

+ (UIImage *)imageWithIconInfo:(SQIconFontInfo *)iconInfo;
@end

NS_ASSUME_NONNULL_END
