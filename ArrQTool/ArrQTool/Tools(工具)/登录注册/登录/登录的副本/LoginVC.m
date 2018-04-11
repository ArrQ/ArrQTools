//
//  LoginVC.m
//  ChatDemo
//
//  Created by ArrQ on 2018/2/5.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "RegisterVC.h"

#define kNaviBg      RGB_Color(40, 166, 168, 1.0)

@interface LoginVC ()

@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIImageView *headerImgView;
@property(nonatomic,strong)UILabel *registerLab;
@property(nonatomic,strong)UIButton *registerBtn;


@property(nonatomic,strong)LoginView *loginView;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self customView];


    
}

- (void)customView{
    
    UIView *headerView = [[UIView alloc]init];
    
    headerView.backgroundColor = kNaviBg;
    [self.view addSubview:headerView];
    _headerView = headerView;
    
    
    UIImageView *imgView_user = [[UIImageView alloc]init];
    
    [imgView_user setImage:[UIImage imageNamed:@"h_tao"]];
    
    imgView_user.backgroundColor = [UIColor orangeColor];
    
    imgView_user.layer.masksToBounds = YES;
    
    imgView_user.layer.cornerRadius = 80/2;
    
    imgView_user.contentMode = UIViewContentModeScaleToFill;

    [_headerView addSubview:imgView_user];

    _headerImgView = imgView_user;
    
    
    UILabel *lable_regist = [[UILabel alloc]init];
    
    lable_regist.text = @"还没有账号?";

    lable_regist.font = [UIFont systemFontOfSize:14];
    lable_regist.textAlignment = NSTextAlignmentLeft;
    lable_regist.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];

    [self.view addSubview:lable_regist];

    _registerLab = lable_regist;
    
    
    
    UIButton *button_register = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_register setTitle:@"去注册" forState:UIControlStateNormal];
    button_register.titleLabel.font = [UIFont systemFontOfSize:14];
    [button_register setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    
    [self.view addSubview:button_register];
    _registerBtn = button_register;
    [_registerBtn addTarget:self action:@selector(registerVC:) forControlEvents:UIControlEventTouchUpInside];
    
//    登录 View
    
    _loginView = [[LoginView alloc]init];
    _loginView.backgroundColor = [UIColor whiteColor];
    _loginView.layer.masksToBounds = YES;
    _loginView.layer.cornerRadius = 5;
    
    
    [self.view addSubview:_loginView];
    __weak typeof (self) weakSelf = self;
    self.loginView.blockLogin = ^(NSString *index) {
        
        
        
    };
    
    
    self.loginView.blockVertifyCode = ^(NSString *index) {
        
        
        
        
    };
    
    
    
    
}




# pragma mark --- 账户开始登录
//- (void)getAccountLogin{
//
//    NSString *accountStr = [userDefault objectForKey:@"登录账号"];
//    NSString *pwdStr = [userDefault objectForKey:@"登录账号密码_001"];
//
//
//    if (accountStr.length == 0)
//    {
//        NSLog(@"请输入用户名");
//
//        [XSInfoView showInfo:@"请输入用户名" onView:self];
//
//        return;
//    }else if (accountStr.length > 24)
//    {
//        NSLog(@"用户名最长不超过24字节");
//        [XSInfoView showInfo:@"用户名最长不超过24字节" onView:self];
//
//        return;
//    }
//
//    if (pwdStr.length == 0)
//    {
//        NSLog(@"请输入密码");
//        [XSInfoView showInfo:@"请输入密码" onView:self];
//
//        return;
//    }else if (pwdStr.length < 8)
//    {
//        NSLog(@"请输入长度为8-16位密码");
//        [XSInfoView showInfo:@"请输入长度为8-16位密码" onView:self];
//
//        return;
//    }else if (pwdStr.length > 16)
//    {
//
//        [XSInfoView showInfo:@"请输入长度为8-16位密码" onView:self];
//
//        NSLog(@"请输入长度为8-16位密码");
//
//        return;
//
//
//    }
//
//
//
//    int result = [[TLSHelper getInstance]TLSPwdLogin:accountStr andPassword:pwdStr andTLSPwdLoginListener:self];
//
//
//    NSLog(@"====%d",result);
//
//}





# pragma mark --- 登陆 界面切换
//- (void)pushToTabBar{
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//        BaseTabBarController *rootView = [[BaseTabBarController alloc]init];
//
//        [UIApplication sharedApplication].delegate.window.rootViewController = rootView;
//
//    });
//
//
//
//}





# pragma mark --- lay view
- (void)viewDidLayoutSubviews{
    
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 200));
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);

        
        
    }];
    
    
    [_headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.centerX.equalTo(_headerView.mas_centerX);
        make.centerY.equalTo(_headerView.mas_centerY);
        
    }];
    
    
    
    
    
    
    [_registerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.centerX.equalTo(self.view.mas_centerX).offset(-60);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        
        
        
        
    }];
    
    
    
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.left.equalTo(_registerLab.mas_right).offset(5);
        make.centerY.equalTo(_registerLab.mas_centerY);
        
        
        
        
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.left.equalTo(_registerLab.mas_right).offset(5);
        make.centerY.equalTo(_registerLab.mas_centerY);
        
        
        
        
    }];
    
    
   
    
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 300));
        make.top.equalTo(self.view.mas_top).offset(180);
        
        make.centerX.equalTo(self.view.mas_centerX);

        
        
    }];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
