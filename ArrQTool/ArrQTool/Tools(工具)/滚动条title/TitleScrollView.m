//
//  TitleScrollView.m
//  123
//
//  Created by ArrQ on 2017/11/4.
//  Copyright © 2017年 ArrQ. All rights reserved.

#import "TitleScrollView.h"
#import "SGTopScrollMenu.h"
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen]
#define MAXFLOAT    0x1.fffffep+127f
#define userDefault [NSUserDefaults standardUserDefaults]

@interface TitleScrollView()<UIScrollViewDelegate,SGTopScrollMenuDelegate>
{
    UIView * lineView;
}
@property (nonatomic, strong) SGTopScrollMenu *topScrollMenu;
@end

@implementation TitleScrollView
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame])
    {
        
    }
    return self;
}




- (void)createScrollView:(NSArray *)titleArray
{
    titleArray = [titleArray copy];
    CGFloat allW = 0;
    NSMutableArray * heightArray = [NSMutableArray new];
    NSMutableArray * myA = [NSMutableArray new];
    for (NSString *str in titleArray )
    {
        allW = allW + [self createSize:str andFont:17 andSize:CGSizeMake(MAXFLOAT, 40)andName:nil].size.width+20;
        [heightArray addObject:[NSString stringWithFormat:@"%f",allW]];
        [myA addObject:str];
    }
    self.topScrollMenu = [SGTopScrollMenu topScrollMenuWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    _topScrollMenu.titlesArr = [NSArray arrayWithArray:myA];
    _topScrollMenu.topScrollMenuDelegate = self;
    [self addSubview:_topScrollMenu];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, self.frame.size.height-50)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO ;
    _scrollView.showsHorizontalScrollIndicator = YES ;
    _scrollView.contentSize = CGSizeMake(titleArray.count*SCREEN_WIDTH,0);
    [self addSubview:_scrollView];
    
    
    
}
- (void)SGTopScrollMenu:(SGTopScrollMenu *)topScrollMenu didSelectTitleAtIndex:(NSInteger)index{
    
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.frame.size.width;
    _scrollView.contentOffset = CGPointMake(offsetX, 0);
    
    
    [self.delegate didSelectedTitleReload:(int)index andTitleArray:_dataSource];
    
    
    if (index == 0) {
        
        _scrollView.backgroundColor = [UIColor redColor];
    }else{
        
        _scrollView.backgroundColor = [UIColor greenColor];

        
    }
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    _scrollView.backgroundColor = [UIColor grayColor];

    
    
}


- (CGRect)createSize:(NSString *)lableStr andFont:(NSInteger)fondS andSize:(CGSize)mysize andName:(NSString *)name;
{
    UIFont *font;
    if (name.length == 0)
    {
        font=[UIFont systemFontOfSize:fondS];
    }else
    {
        font=[UIFont fontWithName:name size:fondS];
    }
    CGRect rect=[lableStr boundingRectWithSize:mysize options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    return rect;
}

@end
