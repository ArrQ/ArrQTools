//
//  showDaxiaojiouTableViewCell.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showDaxiaojiouTableViewCell : UITableViewCell
- (void)cellWithData:(NSDictionary *)dic andXuanHaoMoShi:(NSArray *)xuanhaomoshi andBlock:(void(^)(NSArray *dataArray))result;

@end
