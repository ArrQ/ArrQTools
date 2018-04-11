//
//  DuoXuanCollectionViewCell.h
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/12.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DuoXuanModel.h"

@interface DuoXuanCollectionViewCell : UICollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView andModel:(DuoXuanModel *)model index:(NSIndexPath *)indexPath;


@end
