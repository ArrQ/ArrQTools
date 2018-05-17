//
//  YYCustomSearchView.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/17.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YYCustomSearchView.h"

@interface YYCustomSearchView ()<UITextFieldDelegate>


@property(nonatomic,strong) UIView *searchOneView;


@end


@implementation YYCustomSearchView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
   
    _searchOneView = [[UIView alloc]init];
    _searchOneView.backgroundColor = [UIColor whiteColor];
    _searchOneView.layer.masksToBounds = YES;
    _searchOneView.layer.cornerRadius = 5;
    
    [self addSubview:_searchOneView];
    
    
    UIImageView *imgView_icon = [[UIImageView alloc]init];
    imgView_icon.backgroundColor = [UIColor whiteColor];
    [imgView_icon setImage:[UIImage imageNamed:@"Search_Icon"]];
    imgView_icon.contentMode = UIViewContentModeScaleToFill;

    [_searchOneView addSubview:imgView_icon];
    _leftImgView = imgView_icon;

   
    
    UITextField *field_left = [[UITextField alloc]init];
    field_left.backgroundColor = [UIColor whiteColor];
    field_left.layer.masksToBounds = YES;
    field_left.layer.cornerRadius = 5;
    field_left.font = [UIFont systemFontOfSize:14];
    field_left.placeholder = @"请输入手机号";
    field_left.delegate = self;
    field_left.clearButtonMode = UITextFieldViewModeAlways;
    field_left.textAlignment = NSTextAlignmentLeft;
    field_left.tintColor = [UIColor redColor];
    [_searchOneView addSubview:field_left];

    _leftTextField = field_left;
    
    
    UIButton *button_yuyin = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_yuyin setImage:[UIImage imageNamed:@"Voice_button_icon"] forState:UIControlStateNormal];
    [_searchOneView addSubview:button_yuyin];
    
   _rightYuyinBtn = button_yuyin;
    
    UIButton *button_cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_cancel setTitle:@"取消" forState:UIControlStateNormal];
    button_cancel.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [button_cancel setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_cancel addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button_cancel];
    
    _rightCancelBtn = button_cancel;
    
    _rightCancelBtn.hidden = YES;
    
    
    
    
    
}


# pragma mark --- UITextFieldDelegate


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    _rightCancelBtn.hidden = NO;
    
    [self getFrameOneSearch:_rightCancelBtn];

    
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    
  
    _rightCancelBtn.hidden = YES;
    
    
    [self getFrameOneSearch:_rightCancelBtn];

    
    
    
    
    
}





# pragma mark --- 取消按钮

- (void)cancelBtn:(UIButton *)sender{
    
    [self endEditing:YES];

    _rightCancelBtn.hidden = YES;

    
    [self getFrameOneSearch:_rightCancelBtn];

   
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self endEditing:YES];
    
    _rightCancelBtn.hidden = YES;

    [self getFrameOneSearch:_rightCancelBtn];
    
    

    
}


- (void)getFrameOneSearch:(UIButton *)sender{
    
    CGRect frame = self.searchOneView.frame;
    
    
    if(sender.hidden == YES){
        
        frame.size.width = SCREEN_WIDTH-15*2;

        
    }else{
        

        frame.size.width = SCREEN_WIDTH-_rightCancelBtn.frame.size.width-15*2-15;

    }
    
    _searchOneView.frame = frame;
    
}

# pragma mark --- layout view

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_searchOneView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(2);
        make.bottom.equalTo(self.mas_bottom).offset(-2);
        make.right.equalTo(self.mas_right).offset(-15);


    }];

    
    
    [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.size.mas_equalTo(CGSizeMake(30, 30));
        
        make.left.equalTo(_searchOneView.mas_left).offset(15);
        
        make.centerY.equalTo(_searchOneView.mas_centerY);


    }];
    
    [_leftTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(40);
        make.left.equalTo(_leftImgView.mas_right).offset(15);
        make.right.equalTo(_searchOneView.mas_right).offset(-15);

        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    [_rightYuyinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(_searchOneView.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    
    [_rightCancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(44, 44));

        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY);
        
        
    }];
    

    
    
}



@end
