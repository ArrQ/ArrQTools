//
//  showMasnoryViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/18.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showMasnoryViewController.h"

@interface showMasnoryViewController ()

@property(nonatomic,strong) UILabel *titleLab;
@property(nonatomic,strong) UIButton *titleBtn;

@property(nonatomic,strong) UIButton *titleTwoBtn;

@end

@implementation showMasnoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"约束";
    
    UIButton *button_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_btn setTitle:@"加入" forState:UIControlStateNormal];
    button_btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [button_btn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_btn addTarget:self action:@selector(getMas:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_btn];
    _titleBtn = button_btn;

   
    UIButton *button_btn_TWO = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_btn_TWO setTitle:@"加入2" forState:UIControlStateNormal];
    button_btn_TWO.titleLabel.font = [UIFont systemFontOfSize:14];
    [button_btn_TWO setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_btn_TWO addTarget:self action:@selector(getMasTWO:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_btn_TWO];
    _titleTwoBtn= button_btn_TWO;
    
    
    
    
    UILabel *lable_000 = [[UILabel alloc]init];
    
    lable_000.text = @"娱乐";
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentLeft;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
   
    [self.view addSubview:lable_000];

    _titleLab = lable_000;

   
    [self getMasUI];
    
    
}

- (void)getMas:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    if(sender.selected){
        
        [_titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.view.mas_centerY).offset(-100);
           
        }];
        
    }else{
        
        [_titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            
            
            make.centerY.equalTo(self.view.mas_centerY).offset(100);
            
            
            
        }];
        
        
    }
    
    
    
    
    
    
}



- (void)getMasTWO:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    if(sender.selected){
        
        [_titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.view.mas_centerX).offset(-100);
            
        }];
        
    }else{
        
        [_titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            
            
            make.centerX.equalTo(self.view.mas_centerX).offset(100);

            
            
        }];
        
        
    }
    
    
    
    
    
    
}







- (void)getMasUI{
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.centerX.centerY.equalTo(self.view);
        
        
    }];
    
    
    [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.centerY.equalTo(self.view);
        
        make.centerX.equalTo(self.view.mas_centerX).offset(-100);
        
    }];
    
    
    [_titleTwoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.centerY.equalTo(self.view);
        
        make.centerX.equalTo(self.view.mas_centerX).offset(100);
        
    }];
    
    
}



# pragma mark --- 这里建立 约束  注意 这里 写的 约束  是不能 更新的
- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
//    这里建立 约束  注意 这里 写的 约束  是不能 更新的
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
