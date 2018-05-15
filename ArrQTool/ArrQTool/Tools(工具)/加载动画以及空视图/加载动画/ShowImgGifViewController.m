//
//  ShowImgGifViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "ShowImgGifViewController.h"

#import "ImgGifView.h"
#import "LoadEmptyView.h"

@interface ShowImgGifViewController ()
@property(nonatomic,strong) ImgGifView *imgGitView;// 加载 动画

@property(nonatomic,strong) LoadEmptyView *loadEmptyView;// 加载 空视图
@end

@implementation ShowImgGifViewController

- (LoadEmptyView *)loadEmptyView{
    
    if (!_loadEmptyView) {
        
        _loadEmptyView = [[LoadEmptyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Frank_Tabbar_Height-Frank_Status_Height)];
        
        __weak typeof (self) weakSelf = self;
        self.loadEmptyView.blockClcikView = ^(NSString *index) {
            
             // 请求数据
            
        };
        
    }
    
    return _loadEmptyView;
    
}

- (ImgGifView *)imgGitView{
    
    if (!_imgGitView) {
        
        
        _imgGitView = [[ImgGifView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, (SCREEN_HEIGHT-60)/2, 60, 60)];
        
        [_imgGitView showView];
        
    }
    
    return _imgGitView;
}
- (void)viewDidLoad {
    [super viewDidLoad];



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
