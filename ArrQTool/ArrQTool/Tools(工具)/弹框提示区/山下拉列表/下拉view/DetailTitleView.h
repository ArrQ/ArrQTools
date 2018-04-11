//
//  DetailTitleView.h
//  ArrQTool
//
//  Created by ArrQ on 2018/2/22.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CathecticModel.h"

@protocol DetailTitleViewDelegate <NSObject>

- (void)changeTitle:(CathecticModel *)title and:(int)index;

@end



@interface DetailTitleView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * titleTableView;
@property (nonatomic, assign) id<DetailTitleViewDelegate>delegate;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, strong) NSArray * datailArray;

- (void)creatTitleView;





@end
