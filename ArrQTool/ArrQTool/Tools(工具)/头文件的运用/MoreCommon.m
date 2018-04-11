//
//  MoreCommon.m
//  ArrQTool
//
//  Created by ArrQ on 2018/4/11.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "MoreCommon.h"

@implementation MoreCommon

+(instancetype)shareInstanceManager{
    
   static MoreCommon *manager = nil;
    
   static  dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
        manager = [[MoreCommon alloc]init];
        
    });
    
    return manager;
    
}

- (void)cellWithData:(NSDictionary *)dicOne addBlock:(blockNameClick)BlockName{
    
    
    NSString *str;
    BlockName(str);
    
    
}




- (void)cellWithDataMore:(NSDictionary *)dicOne addBlock:(void (^)(NSString *))BlockName{
    
    self.myIndex = my_index_sel_type;
    
    NSString *str;
    
    str = [self getMyStr];
    
    if (BlockName) {
        
        BlockName(str);
        
    }
    
    
}



- (NSString *)getMyStr{
    
    switch (self.myIndex) {
        case my_index_sel_type:
            return @"小";
            break;
        case my_index_selNo_type:
            return @"大";
            break;
       
        default:
            break;
    }
    
    
   
    return @"未知类型";
    
    
    
}



- (void)getBlockDic:(blcokDicOne)dicOneBlock{
    
    
    NSDictionary *dicOne = [NSDictionary dictionary];
    
    dicOne = @{@"keys":@"values"};
    
    dicOneBlock(dicOne);
    
    
    
}


@end
