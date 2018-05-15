//
//  ImgGifView.m
//  lottery86
//
//  Created by ArrQ on 2017/11/29.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "ImgGifView.h"
@interface ImgGifView ()
@property(nonatomic,strong) UIControl *bgView;
@property(nonatomic,strong) UIImageView *imgView;
@end

@implementation ImgGifView


- (UIControl *)bgView{
    
    if (!_bgView) {
        
        _bgView = [[UIControl alloc]initWithFrame:CGRectMake(0, Frank_StatusAndNavBar_Height, SCREEN_WIDTH, SCREEN_HEIGHT-Frank_StatusAndNavBar_Height)];
        
        [_bgView addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        _bgView.hidden = YES;
        [_bgView addSubview:self];
        
        [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
        
    }
    
    return _bgView;
    
}


- (void)showView{
    
    
    // 1.1 加载所有的图片
    NSMutableArray<UIImage *> *imageArr = [NSMutableArray array];

    for (int i=0; i<11; i++) {
        // 获取图片的名称
        NSString *imageName = [NSString stringWithFormat:@"saizi_%d", i];
        // 创建UIImage对象
        UIImage *image = [UIImage imageNamed:imageName];
        // 加入数组
        [imageArr addObject:image];
    }
    // 设置动画图片
    self.imgView.animationImages = imageArr;
    
    // 设置动画的播放次数
    self.imgView.animationRepeatCount = 0;
    
    // 设置播放时长
    // 1秒30帧, 一张图片的时间 = 1/30 = 0.03333 20 * 0.0333
    self.imgView.animationDuration = 1.0;
    
    // 开始动画
    [self.imgView startAnimating];
    
    _bgView.hidden = NO;
    
    
}

- (void)hideView{
    
    [self.imgView stopAnimating];

    _bgView.hidden = YES;
    _bgView.hidden = nil;

    self.imgView = nil ;
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
    
        self.backgroundColor = [UIColor clearColor];
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    UIImageView *imgView_all = [[UIImageView alloc]init];
    
    imgView_all.backgroundColor = [UIColor clearColor];
    imgView_all.contentMode = UIViewContentModeScaleToFill;
    
    [self addSubview:imgView_all];
    _imgView = imgView_all;
    

    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.centerX.centerY.equalTo(self);
        
    }];
    
    
    
    
}


@end
