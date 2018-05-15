//
//  ShowScrollViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "ShowScrollViewController.h"

#import "YYScrollTitleView.h"

@interface ShowScrollViewController ()
@property (nonatomic,strong) YYScrollTitleView *yyScrollTitleView;

@end

@implementation ShowScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imagesNew = @[@"user_icon_default",@"user_icon_default"];
    NSArray *data = @[@"你好",@"你好"];

    _yyScrollTitleView = [[YYScrollTitleView alloc]init];
    
    _yyScrollTitleView.frame = CGRectMake(0, 80, SCREEN_WIDTH, 80);
    
    [_yyScrollTitleView cellWithDataImgArray:imagesNew andTitle:data];
    [self.view addSubview:_yyScrollTitleView];
    
    _yyScrollTitleView.blockClickIndex = ^(NSIndexPath *indexPath) {
      
      //         这里 处理 标题点击事件
        
        NSLog(@"点击标题====%ld",(long)indexPath.section);
        
    };


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
