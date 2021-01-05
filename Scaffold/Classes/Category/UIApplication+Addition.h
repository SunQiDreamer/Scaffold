//
//  UIApplication+Addition.h
//  MainSearch
//
//  Created by 孙琦 on 2020/2/29.
//  Copyright © 2020 sunqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TYUserInterfaceStyle) {
    TYUserInterfaceStyleUnspecified,
    TYUserInterfaceStyleLight,
    TYUserInterfaceStyleDark
};

typedef NS_ENUM(NSUInteger, TYNetworkStatus) {
    TYNetworkStatusUnknown,
    TYNetworkStatusWifi,
    TYNetworkStatus2G,
    TYNetworkStatus3G,
    TYNetworkStatus4G,
    TYNetworkStatus5G,
    TYNetworkStatusNotReachable
};

typedef NS_ENUM(NSUInteger, TYNetworkCarrier) {
    TYNetworkCarrierUnknown,
    TYNetworkCarrierChinaTelecom,   // 中国电信
    TYNetworkCarrierChinaUnicom,    // 中国联通
    TYNetworkCarrierChinaMobile,    // 中国移动
    TYNetworkCarrierOther
};

@interface UIApplication (Addition)

@property (nonatomic, copy, readonly) NSString *logo;

@property (nonatomic, copy, readonly) NSString *idfa;

@property (nonatomic, copy) NSString *deviceToken;

@property (nonatomic, assign, readonly) BOOL isFirstStart;

// 是否正在审核
@property (nonatomic, assign, getter=isChecking) BOOL checking;

/// 对于UIUserInterfaceStyle的包装，iOS13以前的系统一致返回TYUserInterfaceStyleLight
@property (nonatomic, assign, readonly) TYUserInterfaceStyle userInterfaceStyle;

/// 当前网络的状态
@property (nonatomic, assign, readonly) TYNetworkStatus networkStatus;

/// 网络运营商
@property (nonatomic, assign, readonly) TYNetworkCarrier networkCarrier;

/// 网络运营商
@property (nonatomic, copy, readonly) NSString *networkCarrierName;


@end

NS_ASSUME_NONNULL_END
