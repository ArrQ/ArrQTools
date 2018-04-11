//
//  DanxuanCollectionViewCell.h
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/12.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DanxuanModel.h"

@interface DanxuanCollectionViewCell : UICollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView andModel:(DanxuanModel *)model index:(NSIndexPath *)indexPath;


@end
