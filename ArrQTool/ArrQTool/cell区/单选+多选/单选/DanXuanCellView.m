//
//  DanXuanCellView.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/12.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "DanXuanCellView.h"
#import "DanxuanCollectionViewCell.h"
@interface DanXuanCellView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,assign) NSInteger index;
@property(nonatomic,copy) void (^block)(NSArray *dataArray);

@property(nonatomic,strong) NSMutableArray *dataSelected;

@end

@implementation DanXuanCellView

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

# pragma mark --- UICollectionView
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];

        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[DanxuanCollectionViewCell class] forCellWithReuseIdentifier:@"DanxuanCollectionViewCell"];
        
      
        
    }
    
    return _collectionView;
    
}


# pragma mark --- collectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(_collectionView.frame.size.width/(self.dataArray.count+1), _collectionView.frame.size.width/(self.dataArray.count+1));

}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;

}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;

    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    DanxuanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DanxuanCollectionViewCell" forIndexPath:indexPath];
    
    [cell cellWithdata:self.dataArray[indexPath.row] index:indexPath];
    
    
    return cell;
    

    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.dataSelected removeAllObjects];
    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i<self.dataArray.count; i++) {
        
        DanxuanModel *model = self.dataArray[i];
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
            
            model.isSearchState = @"0";
            
            
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
