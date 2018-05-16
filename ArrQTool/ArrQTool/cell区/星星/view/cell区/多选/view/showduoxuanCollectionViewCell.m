//
//  showduoxuanCollectionViewCell.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showduoxuanCollectionViewCell.h"



@interface showduoxuanCollectionViewCell ()

@property(nonatomic,strong) UILabel *titleLab;

@property(nonatomic,strong) UIImageView *imgBgView;

@end


@implementation showduoxuanCollectionViewCell

- (void)cellWithdata:(BaseXingXingModel *)model index:(NSIndexPath *)indexPath{
    
    self.titleLab.text = model.title;
    
    [self checkSelected:model.isSearchState];
    
}


- (void)checkSelected:(NSString *)isSelected{
    
    if ([isSelected integerValue] == 1) {
        
        self.imgBgView.backgroundColor = [UIColor redColor];
        self.titleLab.textColor = [UIColor whiteColor];
        
    }else{
        
        self.imgBgView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        self.titleLab.textColor = [UIColor orangeColor];
        
        
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
    
    //    [imgView_bg setImage:[UIImage imageNamed:@"user_icon_default"]];
    imgView_bg.contentMode = UIViewContentModeScaleToFill;
    
    imgView_bg.backgroundColor = [UIColor orangeColor];
    
    imgView_bg.layer.masksToBounds = YES;
    
    imgView_bg.layer.cornerRadius = (self.frame.size.width-10)/2;
    
    [self addSubview:imgView_bg];
    
    _imgBgView = imgView_bg;
    
    
    
    UILabel *lable_title = [[UILabel alloc]init];
    lable_title.text = @"1";
    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentCenter;
    lable_title.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    [self addSubview:lable_title];
    
    _titleLab = lable_title;
    
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    [_imgBgView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-10, self.frame.size.width-10));

        make.centerX.centerY.equalTo(self);

        
    }];
    

    
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.equalTo(self);
        
    }];
    
    
    
    
}




@end
