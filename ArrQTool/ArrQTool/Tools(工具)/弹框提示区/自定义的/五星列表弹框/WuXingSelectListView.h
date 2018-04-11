//
//  WuXingSelectListView.h
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/19.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WuXingSelectListView : UIView

- (void)showView:(NSArray *)dataArray andTitleName:(NSString *)titleName;

@property(nonatomic,copy) void(^blockSureXuan)(NSArray *xuanArray,NSString *isSelected);


@end
