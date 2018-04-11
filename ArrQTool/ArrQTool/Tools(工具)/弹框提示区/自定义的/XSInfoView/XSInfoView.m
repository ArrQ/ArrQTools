//
//  XSInfoView.m
//  XSInfoView
//
//  Created by Liwenqiang on 16/11/16.
//  Copyright © 2016年 李文强. All rights reserved.
//

#import "XSInfoView.h"
#import "MysizeAuto.h"

@interface XSInfoView()
{
    XSInfoView *_infoView;
}

@end

@implementation XSInfoViewStyle

- (instancetype)init {
    self = [super init];
    if (self) {
        _backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
        _imageSize = CGSizeMake(60, 60);
        
        _fontSize = 14.0;
        _textColor = [UIColor whiteColor];
        _maxLabelWidth = 200.0;
        
        _durationSeconds = 1.0;
        
        _layoutStyle = XSInfoViewLayoutStyleVertical;
    }
    return self;
}

@end

@interface XSInfoView ()
@property (strong, nonatomic) XSInfoViewStyle *style;
@end

@implementation XSInfoView
- (void)showView:(NSString *)info onView:(UIViewController *)superView
{
    XSInfoViewStyle *style = [[XSInfoViewStyle alloc] init];
    style.info = [NSString stringWithFormat:@"%@",info];
    _infoView = [[XSInfoView alloc] initWithStyle:style];
    [_infoView sizeToFit];
    [superView.view addSubview:_infoView];
    [superView.view bringSubviewToFront:_infoView];
    style.homeVC = superView;
    _infoView.myVC = superView;
    [_infoView addCenterCons];
}
- (void)showDismiss
{
    [_infoView removeFromSuperview];
}
+ (void)showInfo:(NSString *)info onView:(UIViewController *)superView {
    XSInfoViewStyle *style = [[XSInfoViewStyle alloc] init];
    style.info = [NSString stringWithFormat:@"%@",info];
    XSInfoView *infoView = [[XSInfoView alloc] initWithStyle:style];
    [infoView sizeToFit];
    [superView.view addSubview:infoView];
    [superView.view bringSubviewToFront:infoView];
    style.homeVC = superView;
    infoView.myVC = superView;
    [infoView addCenterCons];
    [XSInfoView countDown:style.durationSeconds dimissView:infoView];
}

+ (void)showInfoWithStyle:(XSInfoViewStyle *)style onView:(UIView *)superView {
    XSInfoView *infoView = [[XSInfoView alloc] initWithStyle:style];
    [infoView sizeToFit];
    
    [superView addSubview:infoView];
    [superView bringSubviewToFront:infoView];
    [infoView addCenterCons];
    [XSInfoView countDown:style.durationSeconds dimissView:infoView];
}

+ (void)countDown:(double)duration dimissView:(UIView *)view {
    NSTimer *timer = [NSTimer timerWithTimeInterval:duration target:view selector:@selector(dismiss) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (instancetype)initWithStyle:(XSInfoViewStyle *)style {
    self = [super init];
    if (self) {
        _style = style;
        [self setup];
        self.infoImageView.image = _style.image;
        self.infoLabel.text = _style.info;
        //动态长度
        self.W = [MysizeAuto createSize:_style.info andFont:18 andSize:CGSizeMake(SCREEN_WIDTH, 30)].size.width;
        self.infoLabel.textColor = [UIColor whiteColor];
        self.infoLabel.font = [UIFont systemFontOfSize:_style.fontSize];
        self.infoLabel.preferredMaxLayoutWidth = _style.maxLabelWidth;
        if (_style.layoutStyle == XSInfoViewLayoutStyleVertical) {
            [self layoutVertical];
        } else {
            [self layoutHorizontal];
        }
    }
    return self;
}

- (void)setup
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = self.style.backgroundColor;
    self.layer.cornerRadius = 4.0;
    self.layer.masksToBounds = YES;
    [self addSubview:self.infoImageView];
    [self addSubview:self.infoLabel];
}

- (void)addCenterCons
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.superview.mas_centerX);
    make.centerY.equalTo(self.superview.mas_centerY);
    make.width.equalTo(@0).offset(self.W);
    make.height.equalTo(@30);
    }];
    [self.infoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@0).offset(self.W);
        make.height.equalTo(@30);
    }];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.infoImageView.mas_centerX);
        make.centerY.equalTo(self.infoImageView.mas_centerY);
        make.width.equalTo(@0).offset(self.W);
        make.height.equalTo(@30);
    }];
}

- (void)layoutVertical
{

}

- (void)layoutHorizontal
{

}

- (void)dismiss
{
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{ self.alpha = 0.0;
    } completion:^(BOOL finished)
    {
        [self removeFromSuperview];
//        [self.myVC.navigationController popViewControllerAnimated:YES];
    }];
}

#pragma mark - getters and setters
- (UILabel *)infoLabel
{
    if (!_infoLabel)
    {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.numberOfLines = 0;
        _infoLabel.textAlignment = 1;
        _infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _infoLabel;
}

- (UIImageView *)infoImageView
{
    if (!_infoImageView) {
        _infoImageView = [[UIImageView alloc] init];
        _infoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _infoLabel.textAlignment = 1;
    }
    return _infoImageView;
}

@end
