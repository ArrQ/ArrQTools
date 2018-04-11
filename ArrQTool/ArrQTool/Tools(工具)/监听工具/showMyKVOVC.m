//
//  showMyKVOVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/4/10.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showMyKVOVC.h"

@interface showMyKVOVC ()


{
    FBKVOController *_kvoCtrl;
}
@property(nonatomic,assign) NSInteger index;
@property(nonatomic,assign) UIButton *myIndexBtn;

@end

@implementation showMyKVOVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"监听KVO";
    
    
    self.index = 0;
   
    [self getStartKvo];
    
    [self CustomUI];


}

- (void)dealloc {
    [_kvoCtrl unobserveAll];
}


- (void)getStartKvo{
    
    if (!_kvoCtrl){// 创建
        _kvoCtrl = [FBKVOController controllerWithObserver:self];
    }


    
//  selector  形式
    [_kvoCtrl observe:self keyPath:@"index" options:0 action:@selector(getKvo)];

    
    
//    [_kvoCtrl observe:_person keyPath:@"age" options:0 action:@selector(getKvo)];

    
   
////    block  形式
//    __weak typeof (self) weakSelf = self;
//    [_kvoCtrl observe:self keyPath:@"index" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
//
//        [weakSelf getKvo];
//
//
//    }];
    
    
    
    
}



- (void)CustomUI{
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_ setTitle:@"加入" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    button_.backgroundColor = [UIColor greenColor];
    button_.layer.borderWidth = 1.f;
    button_.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_ addTarget:self action:@selector(getBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];
    
    _myIndexBtn = button_;
    
    
    
}

- (void)getBtn:(UIButton *)sender{
    
    
    self.index++;
    
    NSLog(@"%ld",self.index);
    

    
}


- (void)getKvo{
    
    self.view.backgroundColor = [UIColor redColor];

    
    
    if (self.index == 3) {
        
        self.view.backgroundColor = [UIColor orangeColor];

        
    }else if (self.index == 4){
        
        self.view.backgroundColor = [UIColor greenColor];

        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


    
    
}



-(void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    
    [_myIndexBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.centerX.centerY.equalTo(self.view);

        
    }];
    
    
    
}

@end
