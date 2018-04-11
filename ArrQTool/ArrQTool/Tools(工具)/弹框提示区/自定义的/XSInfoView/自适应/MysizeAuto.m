//
//  MysizeAuto.m
//  mentor-teacher
//
//  Created by wemax on 16/4/27.
//  Copyright © 2016年 wemax. All rights reserved.
//

#import "MysizeAuto.h"

@implementation MysizeAuto
+ (CGRect)createSize:(NSString *)lableStr andFont:(NSInteger)fondS andSize:(CGSize)mysize
{
    UIFont *font=[UIFont systemFontOfSize:fondS];
    CGRect rect=[lableStr boundingRectWithSize:mysize options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    return rect;
}

@end
