//
//  BottomZuoHaoView.h
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomZuoHaoView : UIView

@property(nonatomic,copy) void(^blockCopyBtn)(NSString *index);// 复制 分享


- (void)showView:(NSArray *)dataArray;

- (void)hideView;

@end
