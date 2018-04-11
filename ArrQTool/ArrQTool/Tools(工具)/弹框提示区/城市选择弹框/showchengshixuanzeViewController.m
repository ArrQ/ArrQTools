//
//  showchengshixuanzeViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/24.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showchengshixuanzeViewController.h"

#import "AddressPickerView.h"

@interface showchengshixuanzeViewController ()
@property(nonatomic,strong)AddressPickerView *myAddressPickerView;

@end

@implementation showchengshixuanzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(100, 100, 100, 100);
    [button_ setTitle:@"城市选择" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    
    button_.layer.borderWidth = 1.f;
    button_.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    button_.backgroundColor = [UIColor redColor];
    [button_ addTarget:self action:@selector(btnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];


}



- (void)btnOnclick:(UIButton *)sender{
    
    
    _myAddressPickerView = [AddressPickerView shareInstance];
    [_myAddressPickerView showAddressPickView];
    [self.view addSubview:_myAddressPickerView];
    
    __block NSString *temp;
    _myAddressPickerView.block = ^(NSString *province,NSString *city,NSString *district)
    {
        
        temp = [NSString stringWithFormat:@"%@ %@ %@",province,city,district];
        
        [sender setTitle:temp forState:UIControlStateNormal];

    };
    
  
    
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
