//
//  WYWebProgressLayer.h
//  ArrQTool
//
//  Created by ArrQ on 2017/12/27.
//  Copyright © 2017年 ArrQ. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>

@interface WYWebProgressLayer : CAShapeLayer
- (void)finishedLoad;
- (void)startLoad;
- (void)closeTimer;
@end
