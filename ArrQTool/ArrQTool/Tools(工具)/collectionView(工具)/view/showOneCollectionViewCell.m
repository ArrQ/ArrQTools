//
//  showOneCollectionViewCell.m
//  ArrQTool
//
//  Created by ArrQ on 2018/3/29.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showOneCollectionViewCell.h"


@interface showOneCollectionViewCell ()

@property(nonatomic,strong) UILabel *titleLab;

@end


@implementation showOneCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    UILabel *lable_title = [[UILabel alloc]init];
    lable_title.text = @"娱乐";
    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentCenter;
    lable_title.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    [self addSubview:lable_title];
    _titleLab = lable_title;
    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.centerX.equalTo(self);

        
    }];
    
    
    
    
}




@end
