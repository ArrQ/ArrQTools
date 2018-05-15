//
//  ToolCalendarView.h
//  lottery86
//
//  Created by ArrQ on 2017/11/24.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolCalendarView : UIView
@property (nonatomic, strong)UIControl *bgView;
- (void)hide;

@property(nonatomic,copy) void(^blockStrTime)(NSString *strTime);

@property(nonatomic,copy) void(^blockDateSelNo)(NSString *index);


@end
