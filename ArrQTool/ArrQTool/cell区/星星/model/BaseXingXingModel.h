//
//  BaseXingXingModel.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BaseXingXingModel : JSONModel
@property (nonatomic, strong) NSString *isSearchState;// 是否选中

@property(nonatomic,strong) NSString *title;// 字体
@end
