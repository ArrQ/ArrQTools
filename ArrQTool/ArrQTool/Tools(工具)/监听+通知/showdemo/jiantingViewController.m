//
//  jiantingViewController.m
//  132
//
//  Created by ArrQ on 2017/12/11.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "jiantingViewController.h"
#import "person.h"


#import "tttttViewController.h"
@interface jiantingViewController ()
@property(nonatomic,strong) person *person;
@property(nonatomic,strong) UILabel *strLab;
@end

@implementation jiantingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *lable_000 = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    lable_000.text = @"娱乐";
    
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentLeft;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    lable_000.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:lable_000];
    
    _strLab = lable_000;
    
    _person = [[person alloc]init];
    _person.str = @"nihao";
    _strLab.text = _person.str;
    
    
    [_person addObserver:self forKeyPath:@"str" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame =  CGRectMake(250, 150, 44, 44);
    [button_ setTitle:@"加入" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    
    button_.layer.borderWidth = 1.f;
    button_.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_ addTarget:self action:@selector(getONE) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button_];
    
    
    UIButton *button_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button_1.frame =  CGRectMake(250, 250, 44, 44);
    [button_1 setTitle:@"加入" forState:UIControlStateNormal];
    button_1.titleLabel.font = [UIFont systemFontOfSize:14];
    button_1.layer.masksToBounds = YES;
    button_1.layer.cornerRadius = 5;
    
    button_1.layer.borderWidth = 1.f;
    button_1.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_1 setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_1 addTarget:self action:@selector(getE) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    
    
    
}

- (void)getONE{
    
    self.person.str = @"这里";
    
    
    
}


- (void)getE{
    
    self.person.str = @"出具";
    
    
    
}

//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//
//    self.person.str = @"你好";
//
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"info" object:nil userInfo:@{@"title":@"我终于来啦"}];
//
//
//    tttttViewController *tt = [[tttttViewController alloc]init];
//
//    [self presentViewController:tt animated:YES completion:nil];
//
//}

//  做事情吧
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
    //    self.strLab.text = [NSString stringWithFormat:@"%@",[change objectForKey:@"new"]];
    
    self.strLab.text = [change objectForKey:@"new"];
    
    
    
}

- (void)dealloc{
    
    
    
    [self.person removeObserver:self forKeyPath:@"str" context:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


@end



