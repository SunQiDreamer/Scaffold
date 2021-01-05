//
//  SQIconFontConfig.h
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQIconFontConfig : NSObject

@property (nonatomic, copy) NSDictionary *map;

@property (nonatomic, copy) NSString *fontName;

+ (SQIconFontConfig *)shareInstance;

@end

NS_ASSUME_NONNULL_END
