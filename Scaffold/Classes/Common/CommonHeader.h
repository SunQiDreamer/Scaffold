//
//  CommonHeader.h
//  xianghui
//
//  Created by xianghui on 2018/8/13.
//  Copyright © 2018年 xh. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#define APPName    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]?:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define APPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APPBuild   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APPIconPath   [[[[NSBundle mainBundle] infoDictionary] valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject]
#define APPIcon    [UIImage imageNamed:APPIconPath]
#define APPBundleIdentifier [[NSBundle mainBundle] bundleIdentifier]
#define APPBundleName   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
//判断是否为iPhoneX及以上机型 ios11
//#define IS_GREATER_IPHONEX ([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0)

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue] //系统版本-float

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define KEYWINDOW [[UIApplication sharedApplication] keyWindow]

#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define IS_IPHONE_X (kStatusBarHeight >= 44.0f)
#define kNavigationBarNormalHeight (44)
#define kNavigationBarHeight (kNavigationBarNormalHeight + kStatusBarHeight)
#define kBottomSafeAreaHeight (IS_IPHONE_X?34:0)
//#define kSafeAreaBottomHeight ([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom)
#define kTabBarNormalHeight (49)
#define kTabBarHeight (kTabBarNormalHeight+kBottomSafeAreaHeight)

#define WXINSTALLED [WXApi isWXAppInstalled]
#define kLogRect(rect)  NSLog(@"CGRect:<%@>", NSStringFromCGRect(rect));
#define kLogSize(size)  NSLog(@"CGSize:<%@>", NSStringFromCGSize(size));



#pragma mark - 图片资源获取
#define kIMGFROMBUNDLE( X )     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:X ofType:@""]]
#define kImageNamed( X )         [UIImage imageNamed:X]

#define kLocalString( X )         NSLocalizedString(X, nil)

#define kScale (SCREEN_WIDTH/375.0)
#define kIPadScale (IS_IPAD?1:kScale)
#define kHeightScale (SCREEN_HEIGHT/667.0)

#define kWScale (SCREEN_MIN_LENGTH/375.0)
#define kWIPadScale (IS_IPAD?1.2:kWScale)

#define kMinScale (SCREEN_MIN_LENGTH/375.0)
#define kIPadMinScale (IS_IPAD?1:kMinScale)


#define kFloor(c) floorf(c)
#define kRound(c) roundf(c)
#define kCeil(c) ceilf(c)
#define kMod(c1,c2) fmodf(c1,c2)

#define kHeightScale    (SCREEN_HEIGHT/667.0)

#define kHalfRound(c) (kRound(c*2)*0.5)
#define kHalfFloor(c) (kFloor(c*2)*0.5)
#define kHalfCeil(c) (kCeil(c*2)*0.5)

#pragma mark - 单例
#define DECLARE_SINGLETON(cls_name, method_name)\
+ (cls_name*)method_name;


#define IMPLEMENT_SINGLETON(cls_name, method_name)\
+ (cls_name *)method_name {\
static cls_name *method_name;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
method_name = [[cls_name alloc] init];\
});\
return method_name;\
}

#define UIAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]


#pragma mark - 静态方法
static inline UIEdgeInsets kSafeAreaInsets() {
    static dispatch_once_t onceToken;
    static UIEdgeInsets safeAreaInsets;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            UIWindow *window = [UIApplication sharedApplication].keyWindow?:[UIApplication sharedApplication].windows.lastObject;
            safeAreaInsets = window.safeAreaInsets;
        }else{
            safeAreaInsets = UIEdgeInsetsZero;
        }
    });
    return safeAreaInsets;
}



static inline CGFloat SizeScale(CGFloat size, BOOL adjustIpad){
    size = size * (adjustIpad?kIPadMinScale:kMinScale);
    size = kHalfFloor(size);
    return size;
}

static inline CGFloat sizeWidthScale(CGFloat size, BOOL adjustIpad){
    size = size * (adjustIpad?kWIPadScale:kWScale);
    size = kHalfFloor(size);
    return size;
}

static inline CGFloat CGFloatScale(CGFloat value){
    return SizeScale(value, YES);
}

static inline UIFont* SystemFontScale(CGFloat size){
    UIFont *font = [UIFont systemFontOfSize:CGFloatScale(size)];
    return font;
}


static inline BOOL EmptyString(NSString *str){
    if (!str) {
        return YES;
    }
    if (![str isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (str.length == 0) {
        return YES;
    }
    
    return NO;
}



static inline NSString * GetString(id str){
    if (!str || [str isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if (![str isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@", str];
    }
    return str;
}

#endif /* CommonHeader_h */
