//
//  RefreshManager.h
//  lottery86
//
//  Created by ArrQ on 2017/11/28.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
@interface RefreshManager : NSObject

/**创建单例类*/
+ (instancetype)shareManager;

-(void)refreshOfTableviewHeader:(UITableView *)view refreshGifHeader:(MJRefreshGifHeader *)header;


@end
