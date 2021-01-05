//
//  GQAnimationRefreshHeader.m
//  VentureCapital
//
//  Created by sunqi on 2019/11/22.
//  Copyright © 2019 Tigerye. All rights reserved.
//

#import "GQAnimationRefreshHeader.h"
#import <Lottie/LOTAnimationView.h>
#import <Masonry/Masonry.h>
#import "UIColor+Addition.h"
#import "UIFont+Addition.h"

@interface GQAnimationRefreshHeader ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) LOTAnimationView *pulldownAnimation;
@property (nonatomic, strong) LOTAnimationView *refreshAnimation;
@end

@implementation GQAnimationRefreshHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare {
    [super prepare];
    self.mj_h = 81;
//    [self addSubview:self.title];
    [self addSubview:self.pulldownAnimation];
    [self addSubview:self.refreshAnimation];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews {
    [super placeSubviews];

    [self.pulldownAnimation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(35);
        make.width.height.mas_equalTo(20);
    }];
    
    [self.refreshAnimation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.pulldownAnimation);
        make.top.mas_equalTo(35);
        make.width.height.equalTo(self.pulldownAnimation);
    }];
    
//    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.pulldownAnimation.mas_right).inset(8);
//        make.centerY.equalTo(self.pulldownAnimation);
//        make.height.mas_equalTo(17);
//    }];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
        {
            self.title.text = @"下拉刷新";
            self.pulldownAnimation.hidden = NO;
            self.refreshAnimation.hidden = YES;
            [self.pulldownAnimation play];
            [self.refreshAnimation stop];
        }
            break;
        case MJRefreshStatePulling:
        {
            self.title.text = @"松开刷新";
            self.pulldownAnimation.hidden = YES;
            self.refreshAnimation.hidden = NO;
            [self.pulldownAnimation pause];
            [self.refreshAnimation pause];

            if (@available(iOS 10.0, *)) {
                UIImpactFeedbackGenerator *impactFeedBack = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
                [impactFeedBack prepare];
                [impactFeedBack impactOccurred];
            }
        }
            break;
        case MJRefreshStateRefreshing:
        {
            self.title.text = @"刷新中";
            self.pulldownAnimation.hidden = YES;
            self.refreshAnimation.hidden = NO;
            [self.pulldownAnimation stop];
            [self.refreshAnimation play];
        }
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];

    if (self.state != MJRefreshStateIdle) return;
    self.pulldownAnimation.animationProgress = pullingPercent;
    self.refreshAnimation.animationProgress = pullingPercent;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = kSystemFont12;
        _title.textColor = UIColor.textGray2Color;
    }
    return _title;
}

- (LOTAnimationView *)pulldownAnimation {
    if (!_pulldownAnimation) {
        _pulldownAnimation = [LOTAnimationView animationNamed:@"ctp-xiala-white"];
//        if (UIApplication.sharedApplication.userInterfaceStyle == TYUserInterfaceStyleDark) {
//            _pulldownAnimation = [LOTAnimationView animationNamed:@"ctp-xiala-white"];
//        } else {
//            _pulldownAnimation = [LOTAnimationView animationNamed:@"ctp-xiala-bule"];
//        }
        
        _pulldownAnimation.loopAnimation = YES;
        _pulldownAnimation.hidden = NO;
    }
    return _pulldownAnimation;
}

- (LOTAnimationView *)refreshAnimation {
    if (!_refreshAnimation) {
        _refreshAnimation = [LOTAnimationView animationNamed:@"ctp-shuaxin-white"];
//        if (UIApplication.sharedApplication.userInterfaceStyle == TYUserInterfaceStyleDark) {
//            _refreshAnimation = [LOTAnimationView animationNamed:@"ctp-shuaxin-white"];
//        } else {
//            _refreshAnimation = [LOTAnimationView animationNamed:@"ctp-shuaxin-bule"];
//        }
        
        _refreshAnimation.loopAnimation = YES;
        _refreshAnimation.hidden = YES;
    }
    return _refreshAnimation;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    self.pulldownAnimation.animation = @"ctp-xiala-white";
    self.refreshAnimation.animation = @"ctp-shuaxin-white";
//    if (UIApplication.sharedApplication.userInterfaceStyle == TYUserInterfaceStyleDark) {
//        self.pulldownAnimation.animation = @"ctp-xiala-white";
//        self.refreshAnimation.animation = @"ctp-shuaxin-white";
//    } else {
//        self.pulldownAnimation.animation = @"ctp-xiala-bule";
//        self.refreshAnimation.animation = @"ctp-xiala-bule";
//    }
}

- (void)dealloc {
//    NSLog(@"animation--dealloc");
}

@end
