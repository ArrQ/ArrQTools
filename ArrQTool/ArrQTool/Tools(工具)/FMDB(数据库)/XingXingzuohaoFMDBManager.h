//
//  XingXingzuohaoFMDBManager.h
//  ArrQTool
//
//  Created by ArrQ on 2018/1/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XingXingzuohaoFMDBManager : NSObject


+ (XingXingzuohaoFMDBManager *)shareManager;

- (void)getOpen;

// 获取 和值 数据 
- (void)gethezhihaoma:(NSString *)heZhiName andResult:(void(^)(NSArray *heZhiHaoMaArray))result;

//- (void)getHezhihaomaWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;




// 补充

// 获取 跨度 数据
- (void)getKuaDuWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;



// 获取 和值 数据
- (void)getHezhihaomaWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;



// 获取 大小 数据
- (void)getDaXiaoWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;


// 获取 奇偶 数据
- (void)getJiOuWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;


// 获取 012路 数据
- (void)getShiErLuWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;


// 获取 形态号 数据
- (void)getXingTaiHaoWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *xingtaihaonamearray))result;


// 获取 组选 数据
- (void)getZuXuanWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *zuxuannamearray))result;


// 获取 二码组合 数据
- (void)getErMaZuHeWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;


// 获取 二码和 数据
- (void)getErMaHeWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;



// 获取 二码差 数据
- (void)getErMaChaWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;


// 获取 AC 数据
- (void)getACWithArray:(NSArray *)dataArray andResult:(void(^)(NSArray *hezhinamearray))result;


@end
