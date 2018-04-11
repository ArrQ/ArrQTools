//
//  ZuoHaoTableViewCell.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "ZuoHaoTableViewCell.h"

@interface ZuoHaoTableViewCell ()

@property(nonatomic,strong) UILabel *titleLab;

@property(nonatomic,strong) UITextView *textView;

@property(nonatomic,strong) UIButton *qufanjiBtn;

@property(nonatomic,strong) UIButton *fuzhiAllBtn;
@property(nonatomic,strong) UIButton *shareBtn;


@end

@implementation ZuoHaoTableViewCell

-(void)cellWithDic:(NSArray *)dataArray{
    
    NSString *titleStr =[NSString stringWithFormat:@"做号预览共(%ld)注",dataArray.count];
    _titleLab.text = titleStr;
    _textView.text = [dataArray componentsJoinedByString:@","];
    
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    UILabel *lable_title = [[UILabel alloc]init];
    
    lable_title.text = @"做号预览共(10000)注";

    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentLeft;
    lable_title.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    [self addSubview:lable_title];
    _titleLab = lable_title;
    
    
    
    UITextView *textview = [[UITextView alloc]init];
    
    textview.backgroundColor = RGB_Color(255, 251, 238, 1.0);
    textview.layer.masksToBounds = YES;
    textview.layer.cornerRadius = 5;
    textview.text = @"计划计划计划计划计划计划计划计划计划计划计划计划计划计划计划计划计划计划计划计划";
//    textview.font = [UIFont systemFontOfSize:14];
    textview.font = [UIFont fontWithName:@"courier" size:14];

    textview.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    textview.editable = NO;
    [self addSubview:textview];
    _textView = textview;
    
    
    
    
    UIButton *button_fanji = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_fanji setTitle:@"反 集" forState:UIControlStateNormal];
    button_fanji.titleLabel.font = kFontB(14);
    button_fanji.layer.masksToBounds = YES;
    button_fanji.layer.cornerRadius = 5;
    
    button_fanji.backgroundColor = xingxingBtnBg;
    [button_fanji setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_fanji addTarget:self action:@selector(getBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    button_fanji.tag = 0;
    
    [self addSubview:button_fanji];
    _qufanjiBtn = button_fanji;
    
    
    
    
    UIButton *button_fuzhi = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_fuzhi setTitle:@"复 制" forState:UIControlStateNormal];
    button_fuzhi.titleLabel.font = kFontB(14);
    button_fuzhi.layer.masksToBounds = YES;
    button_fuzhi.layer.cornerRadius = 5;
    
    button_fuzhi.backgroundColor = xingxingBtnBg;
    [button_fuzhi setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_fuzhi addTarget:self action:@selector(getBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    button_fuzhi.tag = 1;
    [self addSubview:button_fuzhi];
    _fuzhiAllBtn = button_fuzhi;

    
    
    
//    UIButton *button_fenxiang = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [button_fenxiang setTitle:@"分享" forState:UIControlStateNormal];
//    button_fenxiang.titleLabel.font = [UIFont systemFontOfSize:14];
//    button_fenxiang.layer.masksToBounds = YES;
//    button_fenxiang.layer.cornerRadius = 5;
//
//    button_fenxiang.backgroundColor = [UIColor blueColor];
//    [button_fenxiang setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button_fenxiang addTarget:self action:@selector(getBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    button_fenxiang.tag = 2;
//
//    [self addSubview:button_fenxiang];
//    _shareBtn = button_fenxiang;
//
//
    
    
    
    
}


# pragma mark --- 点击事件 ---

- (void)getBtnClick:(UIButton *)sender{
    
    NSString *index = [NSString stringWithFormat:@"%ld",sender.tag];
    
    if (self.blockBtn) {
        
        self.blockBtn(index);
        
        
    }
    
    
    
}




# pragma mark --- layout ---
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.height.mas_equalTo(40);
        
        make.top.equalTo(self.mas_top).offset(5);

        make.left.equalTo(self).offset(5);

        
    }];
    
    
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLab.mas_bottom);
        
        make.left.equalTo(_titleLab.mas_left);

        make.right.equalTo(self.mas_right).offset(-5);
        make.bottom.equalTo(_fuzhiAllBtn.mas_top).offset(-5);

        
    }];
    
    
    
    [_qufanjiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 35));
        make.left.equalTo(self.mas_left).offset(SCREEN_WIDTH/2-20-130);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        
    }];
    
    [_fuzhiAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 35));
        make.left.equalTo(_qufanjiBtn.mas_right).offset(30);
        
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        
    }];
    
    
    
//    [_qufanjiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.size.mas_equalTo(CGSizeMake(60, 35));
//        make.left.equalTo(self.mas_left).offset(15);
//
//        make.bottom.equalTo(self.mas_bottom).offset(-10);
//
//    }];
//
//    [_fuzhiAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.size.mas_equalTo(CGSizeMake(60, 35));
//        make.centerX.equalTo(self.mas_centerX).offset(-20);
//
//        make.bottom.equalTo(self.mas_bottom).offset(-10);
//
//    }];
    
//
//
//
//    [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.size.mas_equalTo(CGSizeMake(100, 35));
//        make.right.equalTo(self.mas_right).offset(-15);
//
//        make.bottom.equalTo(self.mas_bottom).offset(-10);
//
//
//    }];
//
    
}




@end
