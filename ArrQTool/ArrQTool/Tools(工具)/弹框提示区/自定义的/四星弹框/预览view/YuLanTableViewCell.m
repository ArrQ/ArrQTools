//
//  YuLanTableViewCell.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YuLanTableViewCell.h"


@interface YuLanTableViewCell ()

@property(nonatomic,strong) UILabel *titleOneLab;
@property(nonatomic,strong) UILabel *titleTwoLab;


@end

@implementation YuLanTableViewCell

-(void)cellWithModel:(YuLanModel *)model{
    
    _titleOneLab.text = [NSString stringWithFormat:@"%@",model.titleOne];
    
    _titleTwoLab.text = [NSString stringWithFormat:@"%@",model.titleTwo];

    
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    UILabel *lable_titleOne = [[UILabel alloc]init];
    
    lable_titleOne.text = @"各位号码已选出";
    
    
    lable_titleOne.font = [UIFont systemFontOfSize:14];
    lable_titleOne.textAlignment = NSTextAlignmentLeft;
    lable_titleOne.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
  
    [self addSubview:lable_titleOne];
    _titleOneLab = lable_titleOne;
    
    
    
    
    UILabel *lable_titleTwo = [[UILabel alloc]init];
    

    
    lable_titleTwo.text = @"[0,1,2,3,4,5,6,7,8,9]";
    
    
    lable_titleTwo.font = [UIFont systemFontOfSize:14];
    lable_titleTwo.textAlignment = NSTextAlignmentLeft;
    lable_titleTwo.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    [self addSubview:lable_titleTwo];
    _titleTwoLab = lable_titleTwo;
    
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_titleOneLab mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.mas_top).offset(5);

        make.left.equalTo(self.mas_left).offset(15);


    }];



    [_titleTwoLab mas_makeConstraints:^(MASConstraintMaker *make) {


        make.left.equalTo(_titleOneLab.mas_left);

        make.top.equalTo(_titleOneLab.mas_bottom).offset(5);

        

        
    }];
    
    
}


@end
