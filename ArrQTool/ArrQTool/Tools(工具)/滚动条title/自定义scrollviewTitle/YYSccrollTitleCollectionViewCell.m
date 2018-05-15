//
//  YYSccrollTitleCollectionViewCell.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YYSccrollTitleCollectionViewCell.h"


@interface YYSccrollTitleCollectionViewCell ()

@property(nonatomic,strong) UILabel *titleLab;

@property(nonatomic,strong) UIImageView *imgView;

@property(nonatomic,strong) UIImageView *bgImgView;


@end


@implementation YYSccrollTitleCollectionViewCell

- (void)cellWithDataImgArray:(NSArray *)imgArray andTitle:(NSArray *)titleArray andIndexPath:(NSIndexPath *)indexPath andSelTitleArr:(NSArray *)SelTitleArr{
    
    NSString *imgURL = imgArray[indexPath.section];
    
//    imgURL = [NSString stringWithFormat:@"%@/static/pc_img/%@.png",Main_URL,imgURL];
//
//
//    [_imgView sd_setImageWithURL:[NSURL URLWithString:imgURL] completed:nil];
    
    _titleLab.text = titleArray[indexPath.section];
    
    
    NSString *indexSel = SelTitleArr[indexPath.section];
    
    if ([indexSel integerValue] == 1) {
        
        //        self.backgroundColor = history_titleTwo_bg;
        
        [self.bgImgView setImage:[UIImage imageNamed:@""]];
        
        
    }else{
        
        [self.bgImgView setImage:[UIImage imageNamed:@""]];
        
        
        self.backgroundColor = [UIColor whiteColor];
        
        
    }
    
    
    
    
}







- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    
    UIImageView *imgView_bg = [[UIImageView alloc]init];
    
    [imgView_bg setImage:[UIImage imageNamed:@"hover_bg"]];
    imgView_bg.contentMode = UIViewContentModeScaleToFill;
    
    [self addSubview:imgView_bg];
    
    _bgImgView = imgView_bg;
    
    
    UILabel *lable_title = [[UILabel alloc]init];
    
    lable_title.text = @"重庆时时彩";
    
    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentLeft;
    lable_title.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    [self addSubview:lable_title];
    
    _titleLab = lable_title;
    
    
    
    UIImageView *imgView_000 = [[UIImageView alloc]init];
    
    [imgView_000 setImage:[UIImage imageNamed:@"user_icon_default"]];
    imgView_000.contentMode = UIViewContentModeScaleToFill;
    
    //    imgView_000.backgroundColor = [UIColor orangeColor];
    
    [self addSubview:imgView_000];
    
    _imgView = imgView_000;
    
    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [_bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.right.equalTo(self);
        
        
        
    }];
    
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(5);
        
        
        
    }];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.imgView.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        
        
    }];
    
    
    
    
    
    
}






@end
