//
//  showCollectionVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/3/29.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showCollectionVC.h"

#import "showOneCollectionViewCell.h"

@interface showCollectionVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * myCollectionView;



@end

@implementation showCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更好用";

    [self.view addSubview:self.myCollectionView];

}



# pragma mark --- UICollectionView
- (UICollectionView *)myCollectionView{
    
    if (!_myCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Frank_StatusAndNavBar_Height) collectionViewLayout:layout];
        _myCollectionView.backgroundColor = [UIColor redColor];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.bounces = NO;
        _myCollectionView.showsVerticalScrollIndicator = NO;
        _myCollectionView.showsHorizontalScrollIndicator = NO;
        [_myCollectionView registerClass:[showOneCollectionViewCell class] forCellWithReuseIdentifier:@"showOneCollectionViewCell"];
        
        [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"footer"];

        
    }
    
    return _myCollectionView;
    
}


# pragma mark --- collectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            return CGSizeMake(SCREEN_WIDTH, 150);
        }
            break;
        case 1:
        {
            return CGSizeMake(SCREEN_WIDTH, 60);
            
            
        }
            break;
        case 2:
        {
            
            return CGSizeMake(SCREEN_WIDTH, 80);
        }
            break;
        case 3:
        {
            if (indexPath.item == 0)
            {
                return CGSizeMake(SCREEN_WIDTH, 40);
            }else
            {
                return CGSizeMake(SCREEN_WIDTH, 160);
            }
            
        }
            break;
        case 4:
        {
            
            if (indexPath.item == 0)
            {
                return CGSizeMake(SCREEN_WIDTH, 40);
            }else
            {
                return CGSizeMake((SCREEN_WIDTH-2.1)/3.0, 40);
                
            }
        }
            
            break;
    }
    return CGSizeMake(0, 0);
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 3) {
        return 0.0;
    }else if (section == 4)
    {
        return 1;
    }else{
        return 1;
    }
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 3) {
        return 0.0;
    }else if (section == 4)
    {
        return 1;
    }else{
        return 1;
    }
    
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(SCREEN_WIDTH, 10);

    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    showOneCollectionViewCell * sectionOneCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showOneCollectionViewCell" forIndexPath:indexPath];
    sectionOneCell.backgroundColor = [UIColor greenColor];
    
    return sectionOneCell;

   
    
}


//对头视图或者尾视图进行设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // 头部
      UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:@"header" forIndexPath:indexPath];
       
        view.backgroundColor = [UIColor blueColor];
        
        return view;
        
    }else{
        // 底部
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"footer"   forIndexPath:indexPath];
        
        view.backgroundColor = [UIColor orangeColor];

        return view;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
