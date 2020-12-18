//
//  UIColor+Addition.h
//  MainSearch
//
//  Created by 孙琦 on 2020/2/8.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kDynamicColor(_lightColor_, _darkColor_) [UIColor dynamicColorWithLightColor:_lightColor_ darkColor:_darkColor_]

#define kDynamicColorHex(_lightColorHex_, _darkColorHex_) [UIColor dynamicColorWithLightColorHex:((__bridge NSString *)CFSTR(#_lightColorHex_)) darkColorHex:((__bridge NSString *)CFSTR(#_darkColorHex_))]

@interface UIColor (Addition)

/// 随机色
@property (nonatomic, strong, class, readonly) UIColor *randomColor;

/// 主题色
@property (nonatomic, strong, class, readonly) UIColor *mainThemeColor;

/**
 浅色主题：0xE62E4D
 深色主题：0xFF4D68
 
 @return 股票涨的颜色.
 */
@property (nonatomic, strong, class, readonly) UIColor *stockUpColor;

/**
 0xFF8126
 
 @return 股票橘色.
 */
@property (nonatomic, strong, class, readonly) UIColor *stockOrange;


/**
 浅色主题：0x1F995C
 深色主题：0x4CD992
 
 @return 股票跌的颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *stockDownColor;

/**
 股票不涨不跌颜色 0x222222
 
 @return 股票不涨不跌颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *stockNormalColor;

/**
 浅色主题：0x222222
 深色主题：0xCCCCCC
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textMainColor;

/**
 浅色主题：0xAAAAAA
 深色主题：0x666666
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textGray2Color;

/**
 浅色主题：0x666666
 深色主题：0xAAAAAA
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textGray3Color;

/**
 浅色主题：0xCCCCCC
 深色主题：0x666666
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textGray4Color;

/**
 浅色主题：0x888888
 深色主题：0xAAAAAA
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textGray5Color;

/**
 浅色主题：0x175CE6
 深色主题：0x4D88FF
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textBlueColor;

/**
 0xE62E4D
 
 @return 文字颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *textRedColor;

/**
 浅色主题：#FFFFFF
 深色主题：#17181A
*/
@property (nonatomic, strong, class, readonly) UIColor *bgMainColor;

/**
 浅色主题：0xF2F3F5
 深色主题：0x292B33
 
 @return 背景颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *bgGrayColor;

/**
 0xEBEEF5
 0x000000
 
 @return 背景颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *bgGray2Color;

/**
 0xEBF1FF
 0x000000
 
 @return 背景颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *bgGray3Color;


/**
 0x175CE6
 
 @return 背景颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *bgBlueColor;

/**
 浅色主题：0xE6E6E6
 深色主题：0xFF000000

@return 分割线颜色
*/
@property (nonatomic, strong, class, readonly) UIColor *lineColor;

/**
 浅色主题：0xF0F0F0
 深色主题：0xFF000000

@return 分割线颜色
*/
@property (nonatomic, strong, class, readonly) UIColor *line2Color;


/**
 #000000  alpha:0.5
 
 @return 遮罩view颜色
 */
@property (nonatomic, strong, class, readonly) UIColor *maskColor;

/**
0xFFB266

@return vip颜色
*/
@property (nonatomic, strong, class, readonly) UIColor *vipColor;

/**
 0xCCCCCC
 */
@property (nonatomic, strong, class, readonly) UIColor *CCCColor;



/// 适配深色模式，是有system version >= 13时，才会生效，小于13时，只会显示浅色颜色
/// @param lightColor 浅色模式颜色
/// @param darkColor 深色模式颜色
+ (UIColor *)dynamicColorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

/// 适配深色模式，是有system version >= 13时，才会生效，小于13时，只会显示浅色颜色
/// @param lightColorHex 浅色模式颜色
/// @param darkColorHex 深色模式颜色
+ (UIColor *)dynamicColorWithLightColorHex:(NSString *)lightColorHex darkColorHex:(NSString *)darkColorHex;

@end

NS_ASSUME_NONNULL_END
