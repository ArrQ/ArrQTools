//
//  WuXingSelectListTableViewCell.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/19.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "WuXingSelectListTableViewCell.h"

@interface WuXingSelectListTableViewCell ()

@property(nonatomic,strong) UILabel *titleOneLab;
@property(nonatomic,strong) UIImageView *leftImg;
@property(nonatomic,strong) UILabel *lineLab;


@end

@implementation WuXingSelectListTableViewCell

- (void)cellWithModel:(WuXingSelectListModel *)model{
    
    _titleOneLab.text = [NSString stringWithFormat:@"%@",model.title];
    
    if ([model.isSearchState integerValue] == 0) {
        
//        _leftImg.backgroundColor = [UIColor blueColor];
        [_leftImg setImage:[UIImage imageNamed:@"未选中_000"]];
        
    }else{
        
//        _leftImg.backgroundColor = [UIColor redColor];// 选中 状态
        [_leftImg setImage:[UIImage imageNamed:@"选中_001"]];

        
        
    }
    
    
    
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    UILabel *lable_titleOne = [[UILabel alloc]init];
    
    lable_titleOne.text = @"大大大大大";
    
    
    lable_titleOne.font = [UIFont systemFontOfSize:14];
    lable_titleOne.textAlignment = NSTextAlignmentLeft;
    lable_titleOne.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    [self addSubview:lable_titleOne];
    _titleOneLab = lable_titleOne;
    
    
    
    UIImageView *imgView_left = [[UIImageView alloc]init];
    
    [imgView_left setImage:[UIImage imageNamed:@"未选中_000"]];
    
//    imgView_left.backgroundColor = [UIColor orangeColor];
    
//    imgView_left.layer.masksToBounds = YES;
//
//    imgView_left.layer.cornerRadius = 15/2;
    
    imgView_left.contentMode = UIViewContentModeScaleToFill;
   
    
    [self addSubview:imgView_left];
    _leftImg = imgView_left;
    
    
    UILabel *lable_Line = [[UILabel alloc]init];

    lable_Line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self addSubview:lable_Line];
    _lineLab = lable_Line;
    
    
    
    
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
  
    
    
    [_leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(self.mas_left).offset(10);
        
        make.size.mas_equalTo(CGSizeMake(15, 15));
        
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    
    
    [_titleOneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(_leftImg.mas_right).offset(15);
        
        make.centerY.equalTo(self.mas_centerY);

        
    }];
    
    
    
    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(1);
        make.right.left.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    

    
    
    
}


@end

