//
//  MoreCommon.h
//  ArrQTool
//
//  Created by ArrQ on 2018/4/11.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, my_index){

    my_index_sel_type              = 0x01,
    my_index_selNo_type              = 0x02,


};

typedef void(^blockNameClick)(NSString *index);


@interface MoreCommon : NSObject


@property(nonatomic,assign) my_index myIndex;



+(instancetype)shareInstanceManager;


- (void)cellWithData:(NSDictionary *)dicOne addBlock:(blockNameClick)BlockName;

- (void)cellWithDataMore:(NSDictionary *)dicOne addBlock:(void(^)(NSString *strName))BlockName;


@property(nonatomic,copy) void(^blockName)(NSString *name);



- (void)getBlockDic:(blcokDicOne)dicOneBlock;



@property(nonatomic,copy) void(^blockMyIndex)(my_moreIndex myIndex);



@end
