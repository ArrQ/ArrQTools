//
//  DuoXuanShuZuView.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/12.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "DuoXuanShuZuView.h"
#import "DuoXuanCollectionViewCell.h"
#import "DuoXuanModel.h"

@interface DuoXuanShuZuView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,assign) NSInteger index;
@property(nonatomic,copy) void (^block)(NSArray *dataArray);

@property(nonatomic,strong) NSMutableArray *dataSelected;

@end


@implementation DuoXuanShuZuView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    [self addSubview:self.collectionView];
    
    
    
}

- (NSMutableArray *)dataSelected{
    
    if (!_dataSelected) {
        
        _dataSelected = [NSMutableArray array];
        
    }
    
    return _dataSelected;
    
    
}
- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
    
}



# pragma mark --- view  显示 隐藏 ---

- (void)showView:(NSArray *)dataArray block:(void (^)(NSArray *))block{
    
    self.block = block;
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
    [self.dataSelected removeAllObjects];
    [self.collectionView reloadData];
    
    
    
}









# pragma mark --- collectionview ----

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat pitch = 10.0;
        CGFloat w = (self.frame.size.width - pitch*11)/11;
        CGFloat h = 34;
        _flowLayout.itemSize = CGSizeMake(w, w);
        _flowLayout.minimumLineSpacing = pitch;
        _flowLayout.minimumInteritemSpacing = pitch;
        _flowLayout.sectionInset = UIEdgeInsetsMake(pitch, pitch, pitch, pitch);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[DuoXuanCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    return [DuoXuanCollectionViewCell cellWithCollectionView:collectionView andModel:self.dataArray[indexPath.row] index:indexPath];
    
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i<self.dataArray.count; i++) {
        
        DuoXuanModel *model = self.dataArray[i];
        if (indexPath.row == i) {
            
            model = self.dataArray[indexPath.row];
            
            if ([model.isSearchState integerValue] == 1) {
                
                model.isSearchState = @"0";
                [self.dataSelected removeObject:@(indexPath.row)];

                
            }else{
                
                model.isSearchState = @"1";
                [self.dataSelected addObject:@(indexPath.row)];

                
            }

            [data addObject:model];
            
        }else{
            
            [data addObject:model];

            
            
        }
        
        
    }
    
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:data];
    [self.collectionView reloadData];
    
    if (self.block) {
        
        self.block(self.dataSelected);
        
        
    }
    
}



@end
