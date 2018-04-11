//
//  CathecticModel.h
//  123
//
//  Created by ArrQ on 2017/11/4.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CathecticModel : NSObject
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * judgeTypeID;
+ (NSMutableArray *)setValue:(NSString *)str;
@end
