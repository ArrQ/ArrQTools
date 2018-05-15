//
//  YYScrollTitleView.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYScrollTitleView : UIView
@property(nonatomic,copy) void(^blockClickIndex)(NSIndexPath *indexPath);

- (void)cellWithDataImgArray:(NSArray *)imgArray andTitle:(NSArray *)titleArray;

@end
