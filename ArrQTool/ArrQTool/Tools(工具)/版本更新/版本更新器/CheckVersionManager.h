//
//  CheckVersionManager.h
//  ArrQTool
//
//  Created by ArrQ on 2018/4/26.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CheckVersionManager : NSObject

/**更新版本管理者*/
+ (instancetype)shareManager;

/**获取Appstore和本地的版本信息进行比较判断是否在当前界面弹出升级提示框*/
- (void)checkAppStoreVersionWithAPPID:(NSString *)appId;

/**获取fir.im信息检查版本更新*/
- (void)checkFir_imVersionWithAPI_Token:(NSString *)api_token;
@end
