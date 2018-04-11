//
//  Header.h
//  ArrQTool
//
//  Created by ArrQ on 2017/12/27.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#ifndef Header_h
#define Header_h

/** 弱引用*/
#define WeakSelf __weak typeof(self) weakSelf = self;

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(__stderrp,"%s %s:%d\t%s\t%s\n",__TIME__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __FUNCTION__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

/**
 *  获取屏幕的宽
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 *  获取屏幕的高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//用于判断设备是否为 iphone X
#define IS_IPHONE_X (fabs( (double)SCREEN_HEIGHT - (double )812) < DBL_EPSILON)

#define IOS11_Version  ([[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending) // @available(iOS 11.0, *)
// 适配 iOS 11 中 adjustsScrollViewInsets 问题
#define Frank_adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)


// 适配 iPhone X
// 状态栏高度
#define Frank_Status_Height (IS_IPHONE_X ? 44.f:20.f) // 直接区别于  iPhoneX 的状态栏高度
#define Current_Status_Height [[UIApplication sharedApplication] statusBarFrame].size.height // 获取状态栏高度
// Tabbar 高度
#define Frank_Tabbar_Height (IS_IPHONE_X ? (49.f + 34.f):49.f) // 直接区别于  iPhoneX 的Tabbar高度
// navigationBar 高度
#define Frank_NavigationBar_Height 44.f // navigationBar高度
// navigationBar + statusBar
#define Frank_StatusAndNavBar_Height (IS_IPHONE_X ? 88.f:64.f) // 直接区别于  iPhoneX 的 navigationBar + statusBar 高度
// Tabbar Safe bottom margin
#define Frank_Tabbar_Safe_BottomMargin (IS_IPHONE_X ? 34.f:0.f) // 底部约束高度

// 配置视图安全区域范围
#define Frank_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

//设置字体大小
#define Frank_FONT(_font_) [UIFont systemFontOfSize:_font_]

#define UserDefaults [NSUserDefaults standardUserDefaults]

//RGB颜色
#define RGB_Color(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]




#endif /* Header_h */
