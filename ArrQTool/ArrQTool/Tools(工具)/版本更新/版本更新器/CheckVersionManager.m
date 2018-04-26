//
//  CheckVersionManager.m
//  ArrQTool
//
//  Created by ArrQ on 2018/4/26.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "CheckVersionManager.h"

@implementation CheckVersionManager

+ (instancetype)shareManager{
    static CheckVersionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CheckVersionManager alloc] init];
    });
    return manager;
}
- (void)checkAppStoreVersionWithAPPID:(NSString *)appId{
    NSURL *APPStoreUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@",appId]];
    NSURLRequest *request = [NSURLRequest requestWithURL:APPStoreUrl];
    //系统网络请求
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        if (err) {
            NSLog(@"从appstore上获取APP信息错误数据===%@",err.description);
            return ;
        }
        if (!data) {
            return;
        }
        NSDictionary *appInfoDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        NSArray *resultArray = [appInfoDict objectForKey:@"results"];
        if (![resultArray count]) {
            NSLog(@"error : resultArray == nil");
            return;
        }
        NSDictionary *infoDict = [resultArray objectAtIndex:0];
        
        //获取appstore上应用的最新版本号
        NSString * appStoreVersion  = infoDict[@"version"];
        
        NSString * appStoreReleseNotes = infoDict[@"releaseNotes"];
        //项目名字
        //        NSString *trackName = infoDict[@"trackName"];
        
        //trackViewUrl : 更新的时候用到的地址
        NSString *trackViewUrl = infoDict[@"trackViewUrl"];
        
        //获取当前设备中应用的版本号
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        
        NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        
        //判断两个版本是否相同
        if ([self compareVersionWithAppStoreVersion:appStoreVersion withcurrentVersion:currentVersion]) {
            NSString *titleStr = [NSString stringWithFormat:@"发现新版本v%@", appStoreVersion];
            NSString *messageStr = [NSString stringWithFormat:@"%@",appStoreReleseNotes];
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (@available(iOS 10.0, *)) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:trackViewUrl] options:@{} completionHandler:nil];
                } else {
                    // Fallback on earlier versions
                }
                //                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:trackViewUrl]];
            }];
            [alertController addAction:cancelAction];
            
            [alertController addAction:sureAction];
            [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
        }else{//版本号和app store上的一致(不需要更新)
            
        }
        
    }];
    [task resume];
}

#pragma mark - fir.im检查版本更新方法
- (void)checkFir_imVersionWithAPI_Token:(NSString *)api_token{
    NSString *bundle_id = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    //    NSURL *APPStoreUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.fir.im/apps/latest/%@?api_token=%@",appId,api_token]];
    NSURL *APPStoreUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.fir.im/apps/latest/%@?api_token=%@&type=ios",bundle_id,api_token]];
    NSURLRequest *request = [NSURLRequest requestWithURL:APPStoreUrl];
    //系统网络请求
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        if (error != nil) {
            NSLog(@"从fir.im上获取APP信息错误数据===%@",error.description);
            return ;
        }
        if (!data) {
            return;
        }
        NSString *TempString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if ([TempString containsString:@"app is not found"]) {
            return;
        }
        NSDictionary *appInfoDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        
        //获取fir.im上应用的最新版本号
        NSString * appStoreVersion  = appInfoDict[@"versionShort"];
        
        //获取fir.im上应用的更新日志
        NSString * appStoreReleseNotes = appInfoDict[@"changelog"];
        if ([appStoreReleseNotes isKindOfClass:[NSNull class]]) {
            appStoreReleseNotes = @"";
        }
        //项目名字
        //        NSString *trackName = appInfoDict[@"name"];
        
        //更新的时候用到的地址
        NSString *trackViewUrl = appInfoDict[@"update_url"];
        
        //获取当前设备中应用的版本号
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        
        NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        
        //判断两个版本是否相同
        if ([self compareVersionWithAppStoreVersion:appStoreVersion withcurrentVersion:currentVersion]) {
            NSString *titleStr = [NSString stringWithFormat:@"发现新版本v%@", appStoreVersion];
            NSString *messageStr = [NSString stringWithFormat:@"%@",appStoreReleseNotes];
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:trackViewUrl] options:@{} completionHandler:nil];
                //                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:trackViewUrl]];
            }];
            [alertController addAction:cancelAction];
            
            [alertController addAction:sureAction];
            [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
        }else{//版本号和app store上的一致(不需要更新)
            
        }
        
    }];
    [task resume];
}

//判断两个版本是否相同
-(BOOL)compareVersionWithAppStoreVersion:(NSString *)appStoreVersion withcurrentVersion:(NSString *)currentVersion
{
    if ([appStoreVersion compare:currentVersion options:NSNumericSearch] == NSOrderedDescending)// 商店版本大，需要更新
    {
        return YES;
    }
    
    return NO;
}
#pragma mark - 获取当前显示的viewController
- (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
}


@end
