//
//  PKshuomingCell.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/25.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "PKshuomingCell.h"

@interface PKshuomingCell ()

@property(nonatomic,strong) UILabel *titleOneLab;
@property(nonatomic,strong) UILabel *lineLab;


@end


@implementation PKshuomingCell


- (void)cellWithdata:(NSString *)title{
    
    
    _titleOneLab.text = title;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    UILabel *lable_titleOne = [[UILabel alloc]init];
    
    lable_titleOne.text = @"号码之中第一位和第二位号码的和";
    
    
    lable_titleOne.font = [UIFont systemFontOfSize:14];
    lable_titleOne.textAlignment = NSTextAlignmentLeft;
    lable_titleOne.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    [self addSubview:lable_titleOne];
    _titleOneLab = lable_titleOne;
    
  
//    
//    UILabel *lable_Line = [[UILabel alloc]init];
//    
//    lable_Line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
//    
//    [self addSubview:lable_Line];
//    _lineLab = lable_Line;
//    
    
    
    
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    

    
    
    [_titleOneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(self.mas_left).offset(35);
        
        make.centerY.equalTo(self.mas_centerY);
        
        
    }];
    
    
    
//    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.height.mas_equalTo(1);
//        make.right.left.equalTo(self);
//        make.top.equalTo(self.mas_top);
//
//    }];
//
//
//
    
    
}


@end
