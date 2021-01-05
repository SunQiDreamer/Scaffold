//
//  UINavigationController+Addition.m
//  MainSearch
//
//  Created by 孙琦 on 2020/3/11.
//  Copyright © 2020 sunqi. All rights reserved.
//

#import "UINavigationController+Addition.h"
#import <YYCategories/YYCategories.h>

@implementation UINavigationController (Addition)

- (void)removeBottomLine {
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    [self hideNavBarBottomLine];
}

//隐藏底部横线
- (void)hideNavBarBottomLine {
    for (UIView *view in self.navigationBar.subviews) {
        if (view.height <= 1) {
            view.hidden = YES;
        }
    }
}

- (void)showNavBarBottomLine {
    for (UIView *view in self.navigationBar.subviews) {
        if (view.height <= 1) {
            view.hidden = NO;
        }
    }
}

@end
