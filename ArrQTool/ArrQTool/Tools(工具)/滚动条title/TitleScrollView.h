//
//  TitleScrollView.h
//  123
//
//  Created by ArrQ on 2017/11/4.
//  Copyright © 2017年 ArrQ. All rights reserved.

#import <UIKit/UIKit.h>

@protocol TitleViewScrollDelegate <NSObject>

@optional
- (void)didSelectedTitleReload:(int)index andTitleArray:(NSMutableArray *)array;
@end

@interface TitleScrollView : UIView
@property (nonatomic, assign) id<TitleViewScrollDelegate>delegate;
@property (nonatomic, strong) UIScrollView * scrollView;


- (void)createScrollView:(NSArray *)titleArray;

@property(nonatomic,strong) NSMutableArray *dataSource;
@end
