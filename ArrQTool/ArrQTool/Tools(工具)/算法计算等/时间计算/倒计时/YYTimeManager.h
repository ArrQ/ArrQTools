//
//  YYTimeManager.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger ,ShowStyle){
    
    ShowStyleHms = 0,        // hh:mm:ss
    ShowStyleMs             // mm:ss
    
};


@interface YYTimeManager : NSObject

+ (instancetype)shareManager;

# pragma mark --- 时分秒

- (void)getTimeHmsMoreWithSecond:(NSInteger)allTime andFinishingBlock:(void(^)(NSString *hhStr,NSString *minStr,NSString *secStr))FinishingBlock andFinishCompleted:(void(^)(NSInteger lastSecond))FinishBlock;

# pragma mark --- 分秒

- (void)getMoreTimeMsWithSecond:(NSInteger)allTime andPlayingBlcok:(void(^)(NSString *minStr,NSString *secStr))PlayingBlcok andFinishCompleted:(void(^)(NSInteger lastSecond))FinishBlock;



# pragma mark --- 格式 时分秒 ,分秒

- (void)getMoreTimeShowType:(ShowStyle)type andSecond:(NSInteger)allTime andPlayingBlcok:(void(^)(NSString *hhStr,NSString *minStr,NSString *secStr))PlayingBlcok andFinishCompleted:(void(^)(NSInteger lastSecond))FinishBlock;




@end
