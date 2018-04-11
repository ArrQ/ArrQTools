//
//  RegisterVC.m
//  ChatDemo
//
//  Created by ArrQ on 2018/3/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "RegisterVC.h"

#import "RegisterView.h"


#define kNaviBg      RGB_Color(40, 166, 168, 1.0)

@interface RegisterVC ()

@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIImageView *headerImgView;
@property(nonatomic,strong)UILabel *registerLab;
@property(nonatomic,strong)UIButton *registerBtn;


@property(nonatomic,strong)RegisterView *loginView;

@end

@implementation RegisterVC

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
    
    lable_regist.text = @"已有账号?";
    
    lable_regist.font = [UIFont systemFontOfSize:14];
    lable_regist.textAlignment = NSTextAlignmentLeft;
    lable_regist.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    [self.view addSubview:lable_regist];
    
    _registerLab = lable_regist;
    
    
    UIButton *button_register = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_register setTitle:@"去登录" forState:UIControlStateNormal];
    button_register.titleLabel.font = [UIFont systemFontOfSize:14];
    [button_register setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    
    [self.view addSubview:button_register];
    _registerBtn = button_register;
    [_registerBtn addTarget:self action:@selector(registerVC:) forControlEvents:UIControlEventTouchUpInside];
    
    //    登录 View
    
    _loginView = [[RegisterView alloc]init];
    _loginView.backgroundColor = [UIColor whiteColor];
    _loginView.layer.masksToBounds = YES;
    _loginView.layer.cornerRadius = 5;
    [self.view addSubview:_loginView];
    
    
    self.loginView.blockLogin = ^(NSString *index) {
        
        
        
        
    };

    
    self.loginView.blockVertifyCode = ^(NSString *index) {
        
        
        
    };
    
    
    
}


# pragma mark --- 去登录
- (void)registerVC:(UIButton *)sender{
    
   
    
//    如果 注册 成功  跳转到 登录 页面
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


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

