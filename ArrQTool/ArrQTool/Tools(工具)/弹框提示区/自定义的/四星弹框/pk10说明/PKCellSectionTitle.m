//
//  PKCellSectionTitle.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/26.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "PKCellSectionTitle.h"



@interface PKCellSectionTitle ()

@property(nonatomic,strong) UILabel *lineLab;

@end


@implementation PKCellSectionTitle

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    UILabel *labtitle = [[UILabel alloc]init];
    
    labtitle.backgroundColor = [UIColor whiteColor];
    labtitle.text = @"示例";
    labtitle.font = kFontB(17);
    labtitle.textAlignment = NSTextAlignmentLeft;
    labtitle.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    
    [self addSubview:labtitle];
    
    _titleLab = labtitle;
    
    UILabel *labline = [[UILabel alloc]init];
   
    labline.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self addSubview:labline];
    
    _lineLab = labline;
    
    
    
    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    
    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(1);
        make.right.left.equalTo(self);
        make.top.equalTo(self.mas_top);
        
    }];
    

    
    
}



@end
