//
//  DanXuanCellView.h
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/12.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DanXuanCellView : UIView

@property(nonatomic,strong) UICollectionView *collectionView;


- (void)showView:(NSArray *)dataArray block:(void (^)(NSArray *dataArray))block;


@end
