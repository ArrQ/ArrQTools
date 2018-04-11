//
//  PKZuoHaoTableViewCell.h
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/25.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKZuoHaoTableViewCell : UITableViewCell

- (void)cellWithDic:(NSArray *)dataArray;

@property(nonatomic,copy) void(^blockBtn)(NSString *index);


@end
