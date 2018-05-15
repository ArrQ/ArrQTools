//
//  HisCalendarView.m
//  lottery86
//
//  Created by ArrQ on 2017/11/23.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "HisCalendarView.h"

@interface HisCalendarView ()


@property(nonatomic,assign) BOOL selOrNo;

@end


@implementation HisCalendarView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    self.selOrNo = NO;
    
    UILabel *lable_title = [[UILabel alloc]init];
    
    
    //lable_title.text = @"2017-11-23 开奖结果";
    lable_title.text = [NSString stringWithFormat:@"%@ 开奖结果",[NSString getCurrentTimesWithFormate:@"yyyy-MM-dd"]];

    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentLeft;
    lable_title.textColor = [UIColor blackColor];
    [self addSubview:lable_title];
    _titleLab = lable_title;
    
    
    
    UIImageView *imgView_arrow = [[UIImageView alloc]init];
    
    [imgView_arrow setImage:[UIImage imageNamed:@"HisCalendar_arrow_down"]];
    imgView_arrow.contentMode = UIViewContentModeScaleToFill;

    [self addSubview:imgView_arrow];
    _arrowImgView = imgView_arrow;
    
    
    UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(calendarViewEvent:)];
    [self addGestureRecognizer:tapView];
    
    
    
}


- (void)calendarViewEvent:(UITapGestureRecognizer *)tap{
    
    if (self.selOrNo == YES) {
        
        self.selOrNo = NO;
        


    }else{
        
        self.selOrNo = YES;


    }
    
    if (self.blockSelView) {
        
        self.blockSelView(self.selOrNo);
        
    }
    
    
    
}





# pragma mark --- lay view
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.centerX.equalTo(self);
        
        
        
    }];
    
    
    
    
    [_arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(self.titleLab.mas_right).offset(10);

        make.centerY.equalTo(self.titleLab.mas_centerY);

    }];
    
    
    
}



@end
