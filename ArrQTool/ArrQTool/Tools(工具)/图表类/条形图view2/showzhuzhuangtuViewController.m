//
//  showzhuzhuangtuViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/29.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "showzhuzhuangtuViewController.h"
#import "PTHistogramView.h"

@interface showzhuzhuangtuViewController ()

@end

@implementation showzhuzhuangtuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSArray *x_arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSArray *value_arr = @[@"1",@"12",@"3",@"14",@"7",@"6",@"5",@"8",@"9"];

    PTHistogramView *ptView = [[PTHistogramView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 200)
                                                           nameArray:x_arr
                                                          countArray:value_arr];

    [self.view addSubview:ptView];
    
    [ptView draw];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
