//
//  CommonFieldTextView.m
//  ChatDemo
//
//  Created by ArrQ on 2018/3/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "CommonFieldTextView.h"

@interface CommonFieldTextView()<UITextFieldDelegate>



@end


@implementation CommonFieldTextView

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
    
    
    
    
}



@end
