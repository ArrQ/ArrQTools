//
//  LoadEmptyView.m
//  CaiPiaoGG
//
//  Created by ArrQ on 2018/5/10.
//  Copyright © 2018年 liyatao. All rights reserved.
//

#import "LoadEmptyView.h"

@interface LoadEmptyView ()

@property(nonatomic,strong)UILabel *titleLab;

@property(nonatomic,strong)UIImageView *imgIocnView;


@end

@implementation LoadEmptyView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    UILabel *lable_title = [[UILabel alloc]init];
    
    lable_title.text = @"数据加载失败，点击屏幕刷新";
  
    
    lable_title.font = [UIFont systemFontOfSize:16];
    lable_title.textAlignment = NSTextAlignmentCenter;
    lable_title.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    
  
    [self addSubview:lable_title];

    _titleLab = lable_title;
    
    
    
    
    UIImageView *imgView_icon = [[UIImageView alloc]init];
    
    [imgView_icon setImage:[UIImage imageNamed:@"LoadEmptyImg_000"]];
    imgView_icon.contentMode = UIViewContentModeScaleToFill;

    
    [self addSubview:imgView_icon];

    
    _imgIocnView = imgView_icon;
    
    
    
    UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(calendarViewEvent:)];
    [self addGestureRecognizer:tapView];
    
    
    
    
    
    
    
    
}

- (void)calendarViewEvent:(UITapGestureRecognizer *)tap{


    if (self.blockClcikView) {
        
        self.blockClcikView(nil);
        
    }


}





# pragma mark --- lay view

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_imgIocnView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.equalTo(self);

        
    }];
    
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.imgIocnView.mas_bottom).offset(10);
        make.centerX.equalTo(self.imgIocnView.mas_centerX);

        
    }];
    
    
    
  
    
    
}



@end
