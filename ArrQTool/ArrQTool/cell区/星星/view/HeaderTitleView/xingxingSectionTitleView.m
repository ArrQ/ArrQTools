//
//  xingxingSectionTitleView.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "xingxingSectionTitleView.h"

@interface xingxingSectionTitleView ()

@property(nonatomic,strong) UIImageView *leftImgView;

@property(nonatomic,strong) UILabel *leftTitleLab;

@property(nonatomic,strong) UIButton *rightOneBtn;
@property(nonatomic,strong) UIButton *rightTwoBtn;




@end

@implementation xingxingSectionTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    
    UIImageView *imgView_left = [[UIImageView alloc]init];
    
    [imgView_left setImage:[UIImage imageNamed:@"user_icon_default"]];
    imgView_left.contentMode = UIViewContentModeScaleToFill;
    
    [self addSubview:imgView_left];

    _leftImgView = imgView_left;
    
    
    UILabel *lable_left = [[UILabel alloc]init];
    
    lable_left.text = @"娱乐";
   
    lable_left.font = [UIFont systemFontOfSize:14];
    lable_left.textAlignment = NSTextAlignmentLeft;
    lable_left.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    
    [self addSubview:lable_left];

    _leftTitleLab = lable_left;
    
    
    UIButton *button_One = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_One setTitle:@"粘贴" forState:UIControlStateNormal];
    button_One.titleLabel.font = [UIFont systemFontOfSize:14];
    button_One.layer.masksToBounds = YES;
    button_One.layer.cornerRadius = 5;
    
    [button_One setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    
    [self addSubview:button_One];
    
    _rightOneBtn = button_One;
    
    
    UIButton *button_two = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_two setTitle:@"清空" forState:UIControlStateNormal];
    button_two.titleLabel.font = [UIFont systemFontOfSize:14];
    button_two.layer.masksToBounds = YES;
    button_two.layer.cornerRadius = 5;
    
    [button_two setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    
    [self addSubview:button_two];
    
    _rightTwoBtn = button_two;
    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(15);

        make.centerY.equalTo(self.mas_centerY);

    }];
    
    
    [_leftTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftImgView.mas_right).offset(15);
        
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    [_rightOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.rightTwoBtn.mas_left).offset(-15);
        
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    
    [_rightTwoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).offset(-15);
        
        make.centerY.equalTo(self.mas_centerY);

        
    }];
    
    
    
}



@end
