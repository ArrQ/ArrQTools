//
//  showFMDBViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/1/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showFMDBViewController.h"
#import "YYFMDBManager.h"
#import "XingXingzuohaoFMDBManager.h"

@interface showFMDBViewController ()

@end

@implementation showFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"关联查询";
    
//    [[YYFMDBManager shareManager] getParentName:^(NSArray *nameArray, NSArray *cidArray) {
//
//
//        NSLog(@"===========%@",nameArray);
//
//
//    }];
//

    
    [self getXingXing];
    


}




- (void)getXingXing{
    
    
    [[XingXingzuohaoFMDBManager shareManager] getOpen];
    
    
//    
//    [[XingXingzuohaoFMDBManager shareManager] gethezhihaoma:@"2" andResult:^(NSArray *heZhiHaoMaArray) {
//        
//        NSLog(@"=======  %@",heZhiHaoMaArray);
//        
//    }];
//    
//    [[XingXingzuohaoFMDBManager shareManager]getHezhihaomaWithArray:@[@"2",@"3"] andResult:^(NSArray *hezhinamearray) {
//        
//        NSLog(@"=======  %@",hezhinamearray);
//        
//        
//    }];
    
    
    
  
    
    [[XingXingzuohaoFMDBManager shareManager]getXingTaiHaoWithArray:@[@"上山",@"凸形",@"N形"] andResult:^(NSArray *xingtaihaonamearray) {
        
        
        NSLog(@"=======  %@",xingtaihaonamearray);

        
    }];
    

    [[XingXingzuohaoFMDBManager shareManager]getZuXuanWithArray:@[@"豹子",@"组4",@"组6"] andResult:^(NSArray *zuxuannamearray) {
        
        NSLog(@"=======  %@",zuxuannamearray);

        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
