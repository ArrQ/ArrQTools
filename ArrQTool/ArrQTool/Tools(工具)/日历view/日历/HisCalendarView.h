//
//  HisCalendarView.h
//  lottery86
//
//  Created by ArrQ on 2017/11/23.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HisCalendarView : UIView

@property(nonatomic,strong) UILabel *titleLab;
@property(nonatomic,strong) UIImageView *arrowImgView;

@property(nonatomic,copy) void(^blockSelView)(BOOL selOrNo);

@end
