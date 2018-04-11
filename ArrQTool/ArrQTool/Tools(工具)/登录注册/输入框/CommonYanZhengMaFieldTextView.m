//
//  CommonYanZhengMaFieldTextView.m
//  ChatDemo
//
//  Created by ArrQ on 2018/3/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "CommonYanZhengMaFieldTextView.h"




@interface CommonYanZhengMaFieldTextView()<UITextFieldDelegate>



@end


@implementation CommonYanZhengMaFieldTextView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    UIImageView *imgView_left = [[UIImageView alloc]init];
    
    [imgView_left setImage:[UIImage imageNamed:@"use_name"]];
    imgView_left.contentMode = UIViewContentModeScaleToFill;
    
    [self addSubview:imgView_left];
    
    _leftImgView = imgView_left;
    
    
    
    UITextField *field_center = [[UITextField alloc]init];
    field_center.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    field_center.layer.masksToBounds = YES;
    field_center.layer.cornerRadius = 5;
    field_center.font = [UIFont systemFontOfSize:14];
    field_center.placeholder = @"请输入账号";
    field_center.delegate = self;
    field_center.clearButtonMode = UITextFieldViewModeAlways;
    field_center.textAlignment = NSTextAlignmentLeft;
    [self addSubview:field_center];
    _centerTextField = field_center;
    
    UILabel *lable_line = [[UILabel alloc]init];
    lable_line.backgroundColor = [UIColor grayColor];
    [self addSubview:lable_line];
    _lineLab = lable_line;
    
    
    UIButton *button_vertify = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_vertify setTitle:@"获取验证码" forState:UIControlStateNormal];
    button_vertify.titleLabel.font = [UIFont systemFontOfSize:14];
    button_vertify.layer.masksToBounds = YES;
    button_vertify.layer.cornerRadius = 5;
    
    [button_vertify setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self addSubview:button_vertify];
    
    _vertifyBtn = button_vertify;
    
    
    
    
    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(25);
        
        make.centerY.equalTo(self.mas_centerY);
        
        
    }];
    
    
    
    [_centerTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(_leftImgView.mas_right).offset(10);
        
        make.centerY.equalTo(self.mas_centerY);
        
        
    }];
    
    
    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(1, 20));
        make.right.equalTo(_vertifyBtn.mas_left).offset(-10);
        make.centerY.equalTo(self.mas_centerY);

        
    }];
    
    
    
    [_vertifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.right.equalTo(self.mas_right).offset(-15);
        
        make.centerY.equalTo(self.mas_centerY);

        
    }];
    
    
    
    
    
}



@end

