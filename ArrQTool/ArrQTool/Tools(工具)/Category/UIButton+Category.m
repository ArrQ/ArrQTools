//
//  UIButton+Category.m
//  GongChangBan
//
//  Created by suge on 16/9/20.
//  Copyright © 2016年 素格. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

@implementation UIButton (Category)
- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath{
    objc_setAssociatedObject(self, "setCurrentIndexPath", currentIndexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSIndexPath *)currentIndexPath
{
    return objc_getAssociatedObject(self, "setCurrentIndexPath");
}
@end
