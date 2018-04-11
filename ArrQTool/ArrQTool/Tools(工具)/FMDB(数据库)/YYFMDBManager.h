//
//  YYFMDBManager.h
//  ArrQTool
//
//  Created by ArrQ on 2018/1/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface YYFMDBManager : NSObject

+ (YYFMDBManager *)shareManager;

/**
 查找一级分类数据
 
 @param result 查找结果
 */
- (void)getParentName:(void (^)(NSArray *nameArray, NSArray *cidArray))result;

/**
 查找二级分类数据
 
 @param cidArray 目标参数数组
 @param result 查找结果
 */
- (void)getSecondaryClassificationName:(NSArray *)cidArray result:(void (^)(NSArray *nameArray,NSArray *cidArray))result;



@end
