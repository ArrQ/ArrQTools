//
//  wuxialunboViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/11.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "wuxialunboViewController.h"
#import "PicturePlayer.h"

@interface wuxialunboViewController ()

@end

@implementation wuxialunboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PicturePlayer *imageScrollView = [[PicturePlayer alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    imageScrollView.imageNameArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    [self.view addSubview:imageScrollView];
    imageScrollView.indexBlock = ^void(NSInteger index){
        NSLog(@"点击了第%ld张", (long)index);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];



}


@end
