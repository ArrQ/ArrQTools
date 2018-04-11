//
//  showshijinxuanzeViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/24.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showshijinxuanzeViewController.h"
#import "UICustomDatePicker.h"

@interface showshijinxuanzeViewController ()

@end

@implementation showshijinxuanzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(100, 100, 100, 100);
    [button_ setTitle:@"日期选择" forState:UIControlStateNormal];
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
    
    
    [UICustomDatePicker showCustomDatePickerAtView:self.view choosedDateBlock:^(NSDate *date) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];//@"YYYY-MM-dd HH:mm:ss"
        NSString *currentTimeString = [formatter stringFromDate:date];
      
        [sender setTitle:currentTimeString forState:UIControlStateNormal];

        
    } cancelBlock:^{
        
    }];
    
    
    
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
