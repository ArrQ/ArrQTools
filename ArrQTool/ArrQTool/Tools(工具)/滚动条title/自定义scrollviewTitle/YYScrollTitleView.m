//
//  YYScrollTitleView.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YYScrollTitleView.h"


#import "YYSccrollTitleCollectionViewCell.h"

#define HMSegmentHeight 80


@interface YYScrollTitleView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *myCollectionView;

@property(nonatomic,strong)NSMutableArray *titleDataArray;

@property(nonatomic,strong)NSMutableArray *imgDataArray;

@property(nonatomic,strong)NSMutableArray *selTitleArray;

@property(nonatomic,assign)BOOL isLoaded;


@end

@implementation YYScrollTitleView

- (void)cellWithDataImgArray:(NSArray *)imgArray andTitle:(NSArray *)titleArray{
    
    
    [self.imgDataArray removeAllObjects];
    [self.imgDataArray addObjectsFromArray:imgArray];
    
    
    [self.titleDataArray removeAllObjects];
    [self.titleDataArray addObjectsFromArray:titleArray];
    
    
    
    NSMutableArray *arrsel = [NSMutableArray array];
    
    NSString *selTitle;
    for (int i = 0; i<titleArray.count; i++) {
        
        if (i == 0) {
            
            selTitle = @"1";
            
        }else{
            
            selTitle = @"0";
            
        }
        
        
        [arrsel addObject:selTitle];
        
        
        
    }
    
    [self.selTitleArray removeAllObjects];
    [self.selTitleArray addObjectsFromArray:arrsel];
    
    
    
    
}



- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    [self addSubview:self.myCollectionView];
    
    
}

# pragma mark --- UICollectionView
- (UICollectionView *)myCollectionView{
    
    if (!_myCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HMSegmentHeight) collectionViewLayout:layout];
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.bounces = NO;
        _myCollectionView.showsVerticalScrollIndicator = NO;
        _myCollectionView.showsHorizontalScrollIndicator = NO;
        [_myCollectionView registerClass:[YYSccrollTitleCollectionViewCell class] forCellWithReuseIdentifier:@"YYSccrollTitleCollectionViewCell"];
        [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
    }
    
    return _myCollectionView;
    
}


# pragma mark --- collectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return self.titleDataArray.count;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(80, 80);
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    
    
    return 0;
    
    
    
    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YYSccrollTitleCollectionViewCell * sectionOneCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YYSccrollTitleCollectionViewCell" forIndexPath:indexPath];
    sectionOneCell.backgroundColor = [UIColor greenColor];
    
    [sectionOneCell cellWithDataImgArray:self.imgDataArray andTitle:self.titleDataArray andIndexPath:indexPath andSelTitleArr:self.selTitleArray];
    
    
    return sectionOneCell;
    
    
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (self.blockClickIndex) {
        
        self.blockClickIndex(indexPath);
        
    }
    
    NSString *selTitle;
    NSMutableArray *selArray = [NSMutableArray array];
    for (int i = 0; i<self.selTitleArray.count; i++) {
        
        if (indexPath.section == i) {
            
            selTitle = @"1";
            
            
        }else{
            
            selTitle = @"0";
            
            
        }
        
        [selArray addObject:selTitle];
        
    }
    
    [self.selTitleArray removeAllObjects];
    [self.selTitleArray addObjectsFromArray:selArray];
    
    
    [self layoutIfNeeded];
    [_myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    [self.myCollectionView reloadData];
    
    
}


# pragma mark --- lay array
- (NSMutableArray *)imgDataArray{
    
    if (!_imgDataArray) {
        
        
        _imgDataArray = [NSMutableArray array];
        
    }
    
    return _imgDataArray;
    
}



- (NSMutableArray *)titleDataArray{
    
    if (!_titleDataArray) {
        
        
        _titleDataArray = [NSMutableArray array];
        
    }
    
    return _titleDataArray;
    
}


- (NSMutableArray *)selTitleArray{
    
    
    if (!_selTitleArray) {
        
        
        _selTitleArray = [NSMutableArray array];
        
    }
    
    return _selTitleArray;
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    
    
    
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    if (self.titleDataArray.count>=4) {
        
        return CGSizeMake(0, 0);
        
        
        
        
    }else{
        
        
        return CGSizeMake((SCREEN_WIDTH-80*self.titleDataArray.count)/(self.titleDataArray.count+1), HMSegmentHeight);
        
        
        
    }
    
    
    
    
}





//对头视图或者尾视图进行设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // 头部
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        view.backgroundColor = [UIColor whiteColor];
        
        return view;
        
    }else{
        
        return nil;
        
    }
}




@end
