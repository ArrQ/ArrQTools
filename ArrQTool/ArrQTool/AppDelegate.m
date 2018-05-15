//
//  AppDelegate.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/11.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "AppDelegate.h"
#import "showViewController.h"
#import "LableViewController.h"
#import "bullViewController.h"
#import "WebPageViewController.h"
#import "showzhuzhuangtuViewController.h"
#import "showzhexian2ViewController.h"
#import "shunzibaozhiduiziVC.h"
#import "showdaojishiViewController.h"// 倒计时
#import "showzhixian1ViewController.h"
#import "showFMDBViewController.h"
#import "showArrayVC.h"
#import "showYanZhengMaVC.h"
#import "showDanXuanVC.h"
#import "showUpDownVC.h"// 上下拉 列表
#import "showxigbieOneViewController.h"// 性别选择

#import "showchengshixuanzeViewController.h"// 城市选择
#import "showshijinxuanzeViewController.h"//日期选择
#import "showxiangceViewController.h"// 相册选择

#import "showCollectionVC.h"// collectionview  实现

#import "showMyKVOVC.h"//监听 kvo

#import "ShowDateViewController.h"

#import "ShowScrollViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    
    ShowScrollViewController *vc = [[ShowScrollViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    
    _window.rootViewController = navi;
    [NSThread sleepForTimeInterval:1.0];
    
    //设置 NAVigationBar 背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    [UINavigationBar appearance].translucent = NO;
    //设置 导航栏字体和颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:21]}];
    
    
    [self getConfigSubAppDelegate];

    
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}


# pragma mark --- 供 子类 使用
- (void)getConfigSubAppDelegate{
    
    
    
    
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
