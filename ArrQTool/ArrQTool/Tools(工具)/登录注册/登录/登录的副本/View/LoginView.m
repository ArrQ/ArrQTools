//
//  LoginView.m
//  ChatDemo
//
//  Created by ArrQ on 2018/2/5.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()<UITextFieldDelegate>

@property(nonatomic,strong) UIButton *zhanghaologinBtn;
@property(nonatomic,strong) UIButton *shoujihaologinBtn;

@property(nonatomic,strong) UIButton *loginBtn;





@property(nonatomic,strong) CommonYanZhengMaFieldTextView *CommonVertify_001;



@property(nonatomic,strong) UIButton *remPswBtn;


@end


@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [userDefault setValue:@"0" forKey:@"登录类型"];
        [userDefault synchronize];
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    UIButton *button_account = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_account setTitle:@"账号登录" forState:UIControlStateNormal];
    button_account.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [button_account setTitleColor:RGB_Color(0, 190, 71, 1.0) forState:UIControlStateNormal];
    [button_account addTarget:self action:@selector(getHiddenPhoneView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button_account];
    _zhanghaologinBtn = button_account;
    
    
    
    UIButton *button_phone = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_phone setTitle:@"手机号登录" forState:UIControlStateNormal];
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

    
   NSString *strAccount = [userDefault objectForKey:@"登录账号"];
    if (strAccount) {
        
        strAccount = @"";
        
        
    }
    _Common_phone.centerTextField.text = strAccount;
    
    
    [self addSubview:_Common_phone];
    
    
    
    
    _CommonPsw_001 = [[CommonFieldTextView alloc]init];
    
    [_CommonPsw_001.leftImgView setImage:[UIImage imageNamed:@"password"]];
    _CommonPsw_001.centerTextField.placeholder = @"请输入密码";
    _CommonPsw_001.centerTextField.delegate = self;
    _CommonPsw_001.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _CommonPsw_001.layer.masksToBounds = YES;
    _CommonPsw_001.layer.cornerRadius = 20;
    
    NSString *typeAccount = [userDefault objectForKey:@"登录类型"];
    NSString *pswStr = [userDefault objectForKey:@"登录账号密码_001"];
    NSString *remPswStatus = [userDefault objectForKey:@"remPswStatus"];

    if ([typeAccount isEqualToString:@"0"]) {
        
        _CommonPsw_001.centerTextField.secureTextEntry = YES;
        if ([remPswStatus isEqualToString:@"1"]) {
            
            if (typeAccount) {
                
                typeAccount = @"";
                
            }
            
            
        }else{
            
            typeAccount = @"";

            
        }
        
       
        
        _CommonPsw_001.centerTextField.text = pswStr;

        
    }else{
        
        _CommonPsw_001.centerTextField.secureTextEntry = NO;

        _CommonPsw_001.centerTextField.text = @"";


        
    }
    
    
    
    
    [self addSubview:_CommonPsw_001];
    
    
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
    
    [button_login setTitle:@"立即登录" forState:UIControlStateNormal];
    button_login.titleLabel.font = [UIFont systemFontOfSize:14];
    button_login.layer.masksToBounds = YES;
    button_login.layer.cornerRadius = 20;
    [button_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_login setBackgroundImage:[UIImage imageNamed:@"login_bg"] forState:UIControlStateNormal];
    [button_login addTarget:self action:@selector(getLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button_login];
    _loginBtn = button_login;
    
    
//  记住密码
    
    UIButton *button_remPsw = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_remPsw setTitleColor:[UIColor colorWithWhite:0.3 alpha:1.0] forState:0];
    [button_remPsw setTitle:@"记住密码" forState:0];
    button_remPsw.titleLabel.font = [UIFont systemFontOfSize:12];
    [button_remPsw setImage:[UIImage imageNamed:@"login_remPsw_no"] forState:UIControlStateNormal];

    button_remPsw.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [button_remPsw addTarget:self action:@selector(getRemPsw:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button_remPsw];
    _remPswBtn = button_remPsw;
    
   NSString *isClick = [kUserDefaults objectForKey:@"remPswStatus"];

    
    if ([isClick isEqualToString:@"1"]) {
        
        [_remPswBtn setImage:[UIImage imageNamed:@"login_remPsw_sel"] forState:UIControlStateNormal];
        
        
    }else{
        
        
        [_remPswBtn setImage:[UIImage imageNamed:@"login_remPsw_no"] forState:UIControlStateNormal];
        
    }
    
    
    
    
  
    

    
    
    
    
    
}






# pragma mark --- 记住密码
- (void)getRemPsw:(UIButton *)sender{
    
    
    NSString *accountStr = [userDefault objectForKey:@"登录账号"];
    NSString *pwdStr = [userDefault objectForKey:@"登录账号密码_001"];

    
    UIButton * sen = sender;
    sen.selected = !sen.selected;
    if (sen.selected)
    {
        if (accountStr.length>0)
        {
            [userDefault setObject:accountStr forKey:@"登录账号"];
        }
        if (pwdStr.length>0)
        {
            [userDefault setObject:pwdStr forKey:@"登录账号密码_001"];
        }
        [userDefault setValue:@"1" forKey:@"remPswStatus"];
        [sender setImage:[UIImage imageNamed:@"login_remPsw_sel"] forState:UIControlStateNormal];

        
        
    }else
    {
        [userDefault removeObjectForKey:@"登录账号密码_001"];
        [userDefault setValue:@"0" forKey:@"remPswStatus"];
        
        [sender setImage:[UIImage imageNamed:@"login_remPsw_no"] forState:UIControlStateNormal];

        
    }
    
    
}



# pragma mark --- 点击事件
- (void)getHiddenPhoneView:(UIButton *)sender{
    
    [userDefault setValue:@"0" forKey:@"登录类型"];
    [userDefault synchronize];
    [_zhanghaologinBtn setTitleColor:RGB_Color(0, 190, 71, 1.0) forState:0];
    [_shoujihaologinBtn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:0];
    
    _CommonVertify_001.hidden = YES;
    
    _CommonPsw_001.hidden = NO;
    
    _remPswBtn.hidden = NO;
    
    _CommonPsw_001.centerTextField.secureTextEntry = YES;
    _Common_phone.centerTextField.placeholder = @"请输入账号";

    
}



- (void)getHiddenAccountView:(UIButton *)sender{
    
    
    [userDefault setValue:@"1" forKey:@"登录类型"];
    [userDefault synchronize];
    
    [_shoujihaologinBtn setTitleColor:RGB_Color(0, 190, 71, 1.0) forState:0];
    
    
    [_zhanghaologinBtn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:0];
    
    _CommonVertify_001.hidden = NO;
    
    _CommonPsw_001.hidden = YES;
    
    _remPswBtn.hidden = YES;

    _CommonPsw_001.centerTextField.secureTextEntry = NO;
    _Common_phone.centerTextField.placeholder = @"请输入手机号";

    
}



- (void)getLoginBtn:(UIButton *)sender{
    
    NSString *strIndex = [NSString stringWithFormat:@"%ld",sender.tag];
    
    if (self.blockLogin) {
        
        self.blockLogin(strIndex);
        
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
    
    NSString *vertifyStr_001 = _CommonVertify_001.centerTextField.text;
    
    if (textField == _Common_phone.centerTextField) {
        
        [userDefault setValue:phoneStr forKey:@"登录账号"];
        [userDefault synchronize];
        
    }
    
    
    if (textField == _CommonPsw_001.centerTextField) {
        
        [userDefault setValue:pswStr_001 forKey:@"登录账号密码_001"];
        [userDefault synchronize];
        
    }
    
  
    
    if (textField == _CommonVertify_001.centerTextField) {
        
        [userDefault setValue:vertifyStr_001 forKey:@"登录手机号验证码_001"];
        [userDefault synchronize];
        
    }
    
    
    
}





# pragma mark --- lay view
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
        
        make.top.equalTo(_shoujihaologinBtn.mas_bottom).offset(25);
        
        
        
    }];
    
    [_CommonPsw_001 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 44));
        make.left.equalTo(_Common_phone.mas_left);
        
        make.top.equalTo(_Common_phone.mas_bottom).offset(25);
        
        
        
    }];
    
    
    [_CommonVertify_001 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 44));
        make.left.equalTo(_Common_phone.mas_left);
        
        make.top.equalTo(_Common_phone.mas_bottom).offset(25);
        
        
        
    }];
    
    
//    补充 记住密码
    
    [_remPswBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_CommonPsw_001.mas_left).offset(25);
    
        make.size.mas_equalTo(CGSizeMake(100, 20));
        
        make.top.equalTo(_CommonPsw_001.mas_bottom).offset(15);
        
        
    }];
    
    
    
    
    
    //   ****** 登录 ******
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 40));
        
        make.centerX.equalTo(self.mas_centerX);
        
        make.bottom.equalTo(self.mas_bottom).offset(-20);
        
        
        
        
        
    }];
    
    
    
    
    
    
}



@end


