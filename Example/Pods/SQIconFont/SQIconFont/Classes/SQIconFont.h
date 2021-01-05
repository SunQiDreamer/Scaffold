//
//  SQIconFont.h
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQIconFont : NSObject

+ (nullable UIFont *)fontWithSize:(CGFloat)size;

+ (nullable UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

+ (void)setFontName:(NSString *)fontName;
@end

NS_ASSUME_NONNULL_END
