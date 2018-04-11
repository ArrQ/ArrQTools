//
//  SubAppDelegate.m
//  ArrQTool
//
//  Created by ArrQ on 2018/4/10.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "SubAppDelegate.h"

@implementation SubAppDelegate

- (void)getConfigSubAppDelegate{
    
    [super getConfigSubAppDelegate];
    
    [UIApplication sharedApplication];
    NSLog(@"我想调用 子类 APPdelegate");
    
    
    
}

@end
