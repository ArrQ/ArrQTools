//
//  tttttViewController.m
//  132
//
//  Created by ArrQ on 2017/12/7.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "tttttViewController.h"

@interface tttttViewController ()

@property(nonatomic,strong) UILabel *lab;
@end

@implementation tttttViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    

    UILabel *lable_000 = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];

    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentLeft;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    lable_000.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:lable_000];
    _lab = lable_000;
//    _lab.text = @"nidek";

    
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(get:) name:@"info" object:nil];

    
    
}

- (void)get:(NSNotification *)dic{
    
  
//   赋值 之后 要 刷新
    NSLog(@"=======%@",dic.userInfo);
    self.lab.text = dic.userInfo[@"title"];
    
    
    
    
}


- (void)dealloc{
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
