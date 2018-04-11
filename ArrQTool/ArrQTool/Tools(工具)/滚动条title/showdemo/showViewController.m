//
//  showViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/11.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "showViewController.h"
#import "TitleScrollView.h"
//#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
//#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
@interface showViewController ()<TitleViewScrollDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) TitleScrollView *titleview;


@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout *flowLayout;

@end

@implementation showViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"顶起来";
    _titleview = [[TitleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
    NSArray *data = @[@"nihaio",@"nihao",@"nihaio",@"nihao",@"nihaio",@"nihao",@"nihaio",@"nihao",@"nihaio",@"nihao",@"nihaio",@"nihao"];
    [_titleview createScrollView:data];
    [self.view addSubview:_titleview];
    
    
    for (int i = 0; i<data.count; i++) {
        
        [_titleview.scrollView addSubview:self.collectionView];
        
    }
    
    
    
    
}


# pragma mark --- collectonView ---

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-60-40)/3, 44);
        _flowLayout.minimumLineSpacing = 20;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 20 , 0, 20);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49-64-40) collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}



#pragma mark - collectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}



- (void)didSelectedTitleReload:(int)index andTitleArray:(NSMutableArray *)array{
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
