//
//  showzhixian1ViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/1/2.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showzhixian1ViewController.h"
#import "HMzsHeaderView.h"

@interface showzhixian1ViewController ()

@end

@implementation showzhixian1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HMzsHeaderView *view = [[HMzsHeaderView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH, 300)];

    [self.view addSubview:view];

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
