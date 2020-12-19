//
//  UIApplication+Addition.m
//  MainSearch
//
//  Created by 孙琦 on 2020/2/29.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

#import "UIApplication+Addition.h"
#import <AdSupport/AdSupport.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "AFNetworkReachabilityManager.h"
#import <YYCategories/YYCategories.h>

@implementation UIApplication (Addition)

- (NSString *)logo {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSDictionary *icons = infoPlist[@"CFBundleIcons"];
    return icons[@"CFBundlePrimaryIcon"][@"CFBundleIconName"];
}

- (void)setDeviceToken:(NSString *)deviceToken {
    [self setAssociateValue:deviceToken withKey:@selector(deviceToken)];
}

- (NSString *)deviceToken {
    return [self getAssociatedValueForKey:@selector(deviceToken)];
}

- (void)setChecking:(BOOL)checking {
    [self setAssociateValue:@(checking) withKey:@selector(isChecking)];
}

- (BOOL)isChecking {
    return [[self getAssociatedValueForKey:@selector(isChecking)] boolValue];
}

- (NSString *)idfa {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

- (TYUserInterfaceStyle)userInterfaceStyle {
    if (@available(iOS 13.0, *)) {
        return UITraitCollection.currentTraitCollection.userInterfaceStyle;
    } else {
        return TYUserInterfaceStyleLight;
    }
}

- (BOOL)isFirstStart {
    return ![NSUserDefaults.standardUserDefaults boolForKey:@"UIApplicationNotFirstStart"];
}

- (TYNetworkStatus)networkStatus {
    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    if (status == AFNetworkReachabilityStatusUnknown) {
        return TYNetworkStatusUnknown;
    }
    
    if (status == AFNetworkReachabilityStatusNotReachable) {
        return TYNetworkStatusNotReachable;
    }
    
    if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
        return TYNetworkStatusWifi;
    }
    
    NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                               CTRadioAccessTechnologyGPRS,
                               CTRadioAccessTechnologyCDMA1x];
    NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,
                               CTRadioAccessTechnologyWCDMA,
                               CTRadioAccessTechnologyHSUPA,
                               CTRadioAccessTechnologyCDMAEVDORev0,
                               CTRadioAccessTechnologyCDMAEVDORevA,
                               CTRadioAccessTechnologyCDMAEVDORevB,
                               CTRadioAccessTechnologyeHRPD];
    NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        CTTelephonyNetworkInfo *teleInfo= [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
        if ([typeStrings4G containsObject:accessString]) {
            return TYNetworkStatus4G;
        } else if ([typeStrings3G containsObject:accessString]) {
            return TYNetworkStatus3G;
        } else if ([typeStrings2G containsObject:accessString]) {
            return TYNetworkStatus2G;
        } else {
            return TYNetworkStatusUnknown;
        }
    } else {
        return TYNetworkStatusUnknown;
    }
}

- (TYNetworkCarrier)networkCarrier {
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *currentCountry = [carrier carrierName];
    if (![currentCountry isNotBlank]) {
       return TYNetworkCarrierUnknown;
    }
    if ([currentCountry isEqualToString:@"中国电信"]) {
        return TYNetworkCarrierChinaTelecom;
    }
    if ([currentCountry isEqualToString:@"中国联通"]) {
        return TYNetworkCarrierChinaUnicom;
    }
    if ([currentCountry isEqualToString:@"中国移动"]) {
        return TYNetworkCarrierChinaMobile;
    }
    return TYNetworkCarrierOther;
}

- (NSString *)networkCarrierName {
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    return [carrier carrierName];
}

@end
