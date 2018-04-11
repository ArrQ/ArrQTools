//
//  showMoreCommonVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/4/11.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showMoreCommonVC.h"

#import "MoreCommon.h"


@interface showMoreCommonVC ()



@end

@implementation showMoreCommonVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"更多的 封装";

   
    
    
    [[MoreCommon shareInstanceManager]cellWithDataMore:nil addBlock:^(NSString *strName) {
        
    
        
        
    }];

    
   
    
    
    
    [[MoreCommon shareInstanceManager]cellWithData:nil addBlock:^(NSString *index) {
        
        
        
    }];
    
    
    [MoreCommon shareInstanceManager].blockName = ^(NSString *name) {
        
        
        
        
    };
    
    
    
    
    
//   app 全局 block  枚举
    [[MoreCommon shareInstanceManager]getBlockDic:^(NSDictionary *dicOne) {
        
        
        
        
        NSLog(@"===== %@",dicOne);
        
        
    }];

    
    
    
    [MoreCommon shareInstanceManager].blockMyIndex = ^(my_moreIndex myIndex) {
        
        if (myIndex == my_index_selNo_type) {
            
            
            
        }
        
        
    };
    
    
    
}



- (void)getBlock:(my_moreIndex)type{
    
    
    if (self.myType == my_index_selNo_type) {
        
      
        
        
        
    }
    
    
    
    if (type == my_index_selNo_type) {
        
        
        
        
    }
    
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
