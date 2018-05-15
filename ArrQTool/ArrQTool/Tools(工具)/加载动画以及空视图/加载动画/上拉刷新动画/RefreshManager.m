//
//  RefreshManager.m
//  lottery86
//
//  Created by ArrQ on 2017/11/28.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "RefreshManager.h"

@implementation RefreshManager
/**创建单例类*/
+ (instancetype)shareManager{
    
    static RefreshManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"shareManager");
        manager = [[RefreshManager alloc] init];
        
    });
    return manager;
}

-(void)refreshOfTableviewHeader:(UITableView *)view refreshGifHeader:(MJRefreshGifHeader *)header{

    NSMutableArray *pullingImages = [NSMutableArray new];
//
//    UIImage *image = [UIImage imageNamed:@"saizi_0"];
//    [pullingImages addObject:image];
//    UIImage *image2 = [UIImage imageNamed:@"saizi_10"];
//    [pullingImages addObject:image2];
//    //    开始
//    NSArray *arrimg = [NSArray arrayWithObject:[pullingImages firstObject]];
//    [header setImages:arrimg  forState:MJRefreshStateIdle];
//    //    结束
//    NSArray *arrimg2 = [NSArray arrayWithObject:[pullingImages lastObject]];
//    [header setImages:arrimg2  forState:MJRefreshStatePulling];
//
    //    中间 过程 当中 要加载的 图片
    NSMutableArray *progressImage = [NSMutableArray new];
    for (NSUInteger i = 0; i<11; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"saizi_%ld", (unsigned long)i]];
        [progressImage addObject:image];
    }
    
    [header setImages:progressImage  forState:MJRefreshStateIdle];
    [header setImages:progressImage  forState:MJRefreshStatePulling];

    
    [header setImages:progressImage forState:MJRefreshStateRefreshing];
    
    //
    
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    
//    // 隐藏状态
//    header.stateLabel.hidden = YES;
//    
//    // 设置文字
//    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
//    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
//    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
//    
//    // 设置字体
//    header.stateLabel.font = [UIFont systemFontOfSize:15];
//    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
//    
//    // 设置颜色
//    header.stateLabel.textColor = [UIColor redColor];
//    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];

    view.mj_header = header;
    
    
}






@end
