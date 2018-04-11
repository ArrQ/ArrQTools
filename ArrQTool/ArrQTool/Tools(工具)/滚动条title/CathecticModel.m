//
//  CathecticModel.m
//  123
//
//  Created by ArrQ on 2017/11/4.
//  Copyright © 2017年 ArrQ. All rights reserved.

#import "CathecticModel.h"

@implementation CathecticModel
+ (NSMutableArray *)setValue:(NSString *)str
{
    NSMutableArray * array = [NSMutableArray new];
    
    NSArray * firstArray = [str componentsSeparatedByString:@"^"];
    for (int i = 0; i<firstArray.count; i++)
    {
        NSArray * lastArray = [firstArray[i] componentsSeparatedByString:@","];
        CathecticModel * model = [CathecticModel new];
        model.id = lastArray[2];
        model.type = lastArray[3];
        model.name = lastArray[0];
        if ([model.name isEqualToString:@"北京五分彩"]) {
            
        }else{
            model.judgeTypeID = lastArray[1];
            [array addObject:model];
        }
    }
    return array;
}
@end
