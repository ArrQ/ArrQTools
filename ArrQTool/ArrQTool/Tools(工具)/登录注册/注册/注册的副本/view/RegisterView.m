//
//  RegisterView.m
//  ChatDemo
//
//  Created by ArrQ on 2018/3/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "RegisterView.h"


#import "CommonFieldTextView.h"

#import "CommonYanZhengMaFieldTextView.h"


@interface RegisterView ()<UITextFieldDelegate>

@property(nonatomic,strong) UIButton *zhanghaologinBtn;
@property(nonatomic,strong) UIButton *shoujihaologinBtn;

@property(nonatomic,strong) UIButton *loginBtn;



@property(nonatomic,strong) CommonFieldTextView *Common_phone;
@property(nonatomic,strong) CommonFieldTextView *CommonPsw_001;
@property(nonatomic,strong) CommonFieldTextView *CommonPsw_002;

@property(nonatomic,strong) CommonYanZhengMaFieldTextView *CommonVertify_001;


@end


@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [userDefault setValue:@"0" forKey:@"注册类型"];
        [userDefault synchronize];
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    UIButton *button_account = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_account setTitle:@"账号注册" forState:UIControlStateNormal];
    button_account.titleLabel.font = [UIFont systemFontOfSize:14];

    [button_account setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button_account addTarget:self action:@selector(getHiddenPhoneView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button_account];
    _zhanghaologinBtn = button_account;
    
    
    
    UIButton *button_phone = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_phone setTitle:@"手机号注册" forState:UIControlStateNormal];
    button_phone.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [button_phone setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_phone addTarget:self action:@selector(getHiddenAccountView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button_phone];
    _shoujihaologinBtn = button_phone;
    
    
 
    
    _Common_phone = [[CommonFieldTextView alloc]init];
    
    [_Common_phone.leftImgView setImage:[UIImage imageNamed:@"use_name"]];
    _Common_phone.centerTextField.placeholder = @"请输入账号";
    _Common_phone.centerTextField.delegate = self;
    _Common_phone.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _Common_phone.layer.masksToBounds = YES;
    _Common_phone.layer.cornerRadius = 20;
    
    [self addSubview:_Common_phone];
    
    
    
    
    _CommonPsw_001 = [[CommonFieldTextView alloc]init];
    
    [_CommonPsw_001.leftImgView setImage:[UIImage imageNamed:@"password"]];
    _CommonPsw_001.centerTextField.placeholder = @"请输入密码";
    _CommonPsw_001.centerTextField.delegate = self;

    _CommonPsw_001.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _CommonPsw_001.layer.masksToBounds = YES;
    _CommonPsw_001.layer.cornerRadius = 20;
    
    [self addSubview:_CommonPsw_001];
    
    
    
    _CommonPsw_002 = [[CommonFieldTextView alloc]init];
    _CommonPsw_002.centerTextField.delegate = self;

    [_CommonPsw_002.leftImgView setImage:[UIImage imageNamed:@"password"]];
    _CommonPsw_002.centerTextField.placeholder = @"请确认密码";

    _CommonPsw_002.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _CommonPsw_002.layer.masksToBounds = YES;
    _CommonPsw_002.layer.cornerRadius = 20;
    
    [self addSubview:_CommonPsw_002];
    
    
    
    _CommonVertify_001 = [[CommonYanZhengMaFieldTextView alloc]init];
    
    [_CommonVertify_001.leftImgView setImage:[UIImage imageNamed:@"password"]];
    _CommonVertify_001.centerTextField.placeholder = @"请输入验证码";
    _CommonVertify_001.centerTextField.delegate = self;

    _CommonVertify_001.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _CommonVertify_001.layer.masksToBounds = YES;
    _CommonVertify_001.layer.cornerRadius = 20;
    _CommonVertify_001.hidden = YES;
    [self addSubview:_CommonVertify_001];
    [_CommonVertify_001.vertifyBtn addTarget:self action:@selector(getVertifyBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    // 立即注册
    
    
    UIButton *button_login = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_login setTitle:@"立即注册" forState:UIControlStateNormal];
    button_login.titleLabel.font = [UIFont systemFontOfSize:14];
    button_login.layer.masksToBounds = YES;
    button_login.layer.cornerRadius = 20;
    [button_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_login setBackgroundImage:[UIImage imageNamed:@"login_bg"] forState:UIControlStateNormal];
    [button_login addTarget:self action:@selector(getLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button_login];
    _loginBtn = button_login;
    
    
 
    
}





# pragma mark --- 点击事件 ----


- (void)getHiddenPhoneView:(UIButton *)sender{
    
    [userDefault setValue:@"0" forKey:@"注册类型"];
    [userDefault synchronize];

    [_zhanghaologinBtn setTitleColor:[UIColor redColor] forState:0];
    [_shoujihaologinBtn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:0];
    
    _CommonVertify_001.hidden = YES;
    
    _CommonPsw_001.hidden = NO;
    _CommonPsw_002.hidden = NO;

    
}



- (void)getHiddenAccountView:(UIButton *)sender{
    
    
    [userDefault setValue:@"1" forKey:@"注册类型"];
    [userDefault synchronize];
  
    
    [_shoujihaologinBtn setTitleColor:[UIColor redColor] forState:0];
    
    
    [_zhanghaologinBtn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:0];
    
    _CommonVertify_001.hidden = NO;
    
    _CommonPsw_001.hidden = YES;
    _CommonPsw_002.hidden = YES;

    
    
}



- (void)getLoginBtn:(UIButton *)sender{
    
   
    if (self.blockLogin) {
        
        self.blockLogin(nil);
        
    }
    
  
    
}

- (void)getVertifyBtn:(UIButton *)sender{
    
    
    if (self.blockVertifyCode) {
        
        self.blockVertifyCode(nil);
        
    }
    
    
}



# pragma mark --- textfield

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    NSString *phoneStr = _Common_phone.centerTextField.text;
    NSString *pswStr_001 = _CommonPsw_001.centerTextField.text;
    NSString *pswStr_002 = _CommonPsw_002.centerTextField.text;

    NSString *vertifyStr_001 = _CommonVertify_001.centerTextField.text;

    if (textField == _Common_phone.centerTextField) {
        
        [userDefault setValue:phoneStr forKey:@"注册账号"];
        [userDefault synchronize];
        
    }
    
    
    if (textField == _CommonPsw_001.centerTextField) {
        
        [userDefault setValue:pswStr_001 forKey:@"注册账号密码_001"];
        [userDefault synchronize];
        
    }
    
    
    if (textField == _CommonPsw_002.centerTextField) {
        
        [userDefault setValue:pswStr_002 forKey:@"注册账号密码_002"];
        [userDefault synchronize];
        
    }
    
    if (textField == _CommonVertify_001.centerTextField) {
        
        [userDefault setValue:vertifyStr_001 forKey:@"注册手机号验证码_001"];
        [userDefault synchronize];
        
    }
    
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    NSLog(@"%@",textField.text);
    
    
}



# pragma mark --- layout View

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    
    
    [_zhanghaologinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(self.mas_left).offset(40);
        
        make.top.equalTo(self.mas_top).offset(10);
        
        
        
    }];
    
    
    [_shoujihaologinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.right.equalTo(self.mas_right).offset(-40);
        
        make.centerY.equalTo(_zhanghaologinBtn.mas_centerY);
        
        
    }];
    
    
    [_Common_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 44));
        make.left.equalTo(self.mas_left).offset(10);
        
        make.top.equalTo(_shoujihaologinBtn.mas_bottom).offset(15);
        
        
        
    }];
    
    [_CommonPsw_001 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 44));
        make.left.equalTo(_Common_phone.mas_left);
        
        make.top.equalTo(_Common_phone.mas_bottom).offset(15);
        
        
        
    }];
  
    
    [_CommonVertify_001 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 44));
        make.left.equalTo(_Common_phone.mas_left);
        
        make.top.equalTo(_Common_phone.mas_bottom).offset(15);
        
        
        
    }];
    
    
    
    
    [_CommonPsw_002 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 44));
        make.left.equalTo(_CommonPsw_001.mas_left);

        make.top.equalTo(_CommonPsw_001.mas_bottom).offset(15);
        
        
        
    }];
    
    
    
    
    //   ****** 注册 ******
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 40));
        
        make.centerX.equalTo(self.mas_centerX);
        
        make.bottom.equalTo(self.mas_bottom).offset(-20);
        
        
        
        
        
    }];
    
    
    
   
    
    
}



@end

