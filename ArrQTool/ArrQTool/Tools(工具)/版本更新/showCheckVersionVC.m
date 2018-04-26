//
//  showCheckVersionVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/4/26.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showCheckVersionVC.h"

#import "CheckVersionManager.h"

//参考 fir app_token
#define App_token @"2e36280948ca380c08b62a3840eb612e"

@interface showCheckVersionVC ()

@end

@implementation showCheckVersionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新版本";

    
    //检查版本更新  firm
    [[CheckVersionManager shareManager] checkFir_imVersionWithAPI_Token:App_token];

    
    //检查版本更新 appstore
    [[CheckVersionManager shareManager] checkAppStoreVersionWithAPPID:@"appid"];

    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
