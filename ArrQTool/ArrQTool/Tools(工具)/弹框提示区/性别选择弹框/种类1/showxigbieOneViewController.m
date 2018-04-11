//
//  showxigbieOneViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/24.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showxigbieOneViewController.h"

#import "YLActionSheet.h"
@interface showxigbieOneViewController ()<YLActionSheetDelegate>
@property (nonatomic, strong) YLActionSheet *actionSheet;

@end

@implementation showxigbieOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(100, 100, 100, 100);
    [button_ setTitle:@"性别" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    
    button_.layer.borderWidth = 1.f;
    button_.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    button_.backgroundColor = [UIColor redColor];
    [button_ addTarget:self action:@selector(btnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];
    
    self.actionSheet = [[YLActionSheet alloc] initWithTitle:@"选择类型"
                                               withDelegate:self
                                               actionTitles:@"支付宝", @"微信",@"银行卡", nil];
    
    




}

- (void)btnOnclick:(UIButton *)sender{
    
    
    // 充值类型
    [self.actionSheet showInView:self.view];
    
    
    
    
    
}



# pragma mark --- delegate 类型选择 -----

- (void)ylActionSheet:(YLActionSheet *)actionSheet actionAtIndex:(NSInteger)actionIndex
{
    NSLog(@"action sheet call back, actionIndex:%ld", actionIndex);
}

- (void)ylActionSheetCanceld:(YLActionSheet *)actionSheet
{
    NSLog(@"action sheet call back, click cancel");
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
