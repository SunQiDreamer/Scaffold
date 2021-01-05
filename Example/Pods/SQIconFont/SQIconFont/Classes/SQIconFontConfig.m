//
//  SQIconFontConfig.m
//  MainSearch
//
//  Created by sunqi on 2019/11/14.
//  Copyright © 2019 sunqi. All rights reserved.
//

#import "SQIconFontConfig.h"

@interface SQIconFontConfig ()

@end

@implementation SQIconFontConfig

+ (SQIconFontConfig *)shareInstance {
    static dispatch_once_t onceToken;
    static SQIconFontConfig *instance;
    dispatch_once(&onceToken, ^{
        instance = [[SQIconFontConfig alloc] init];
        instance.fontName = [instance defaultFontName];
    });
    return instance;
}

- (NSString *)defaultFontName {
    return @"iconfont";
}

@end

