//
//  DanxuanCollectionViewCell.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/12.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "DanxuanCollectionViewCell.h"
@interface DanxuanCollectionViewCell ()

@property(nonatomic,strong) UILabel *titleLab;




@end

@implementation DanxuanCollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView andModel:(DanxuanModel *)model index:(NSIndexPath *)indexPath{
    
    DanxuanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.titleLab.text = model.title;
    
    [cell checkSelected:model.isSearchState];
    
    return cell;
    
    
    
}

- (void)checkSelected:(NSString *)isSelected{
    
    if ([isSelected integerValue] == 1) {
        
        self.backgroundColor = [UIColor redColor];
        self.titleLab.textColor = [UIColor redColor];
        
    }else{
        
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        self.titleLab.textColor = [UIColor orangeColor];
        
        
    }
    
    
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat w = (SCREEN_WIDTH - 10*11)/11;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = w/2;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:1.0].CGColor;
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    UILabel *lable_title = [[UILabel alloc]init];
    lable_title.text = @"重庆时时彩";
    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentCenter;
    lable_title.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    [self addSubview:lable_title];
    
    _titleLab = lable_title;
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.centerX.centerY.equalTo(self);
        
    }];
    
    
    
    
}






@end
