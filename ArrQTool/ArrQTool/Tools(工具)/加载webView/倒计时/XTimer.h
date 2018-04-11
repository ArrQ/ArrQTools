//
//  XTimer.h
//  ArrQTool
//
//  Created by ArrQ on 2017/12/27.
//  Copyright © 2017年 ArrQ. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface XTimer : NSObject
@property  NSTimeInterval ti;
@property (nullable,weak) id atarget;
@property (nullable,nonatomic, assign) SEL aSelector;
@property (nullable, retain) id userInfo;
+ (nullable XTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(nullable id)aTarget selector:(nullable SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
- (void)reStart;
- (void)stop;
- (void)invalidate;
@end
