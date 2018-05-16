//
//  yyshowxingxingOneView.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface yyshowxingxingOneView : UIView

@property(nonatomic,strong) UICollectionView *collectionView;

- (void)showView:(NSArray *)dataArray block:(void (^)(NSArray *dataArray))block;

@end
