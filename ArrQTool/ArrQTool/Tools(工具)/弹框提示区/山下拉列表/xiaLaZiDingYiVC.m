//
//  xiaLaZiDingYiVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/22.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "xiaLaZiDingYiVC.h"

#import "DetailTitleView.h"

@interface xiaLaZiDingYiVC ()<UITableViewDelegate,UITableViewDataSource,DetailTitleViewDelegate>{
    
    
    UIView * maskView;//透明的蒙版view
    DetailTitleView * alertView;//向下展开view
    UIImageView *imageView;//导航栏三角按钮

    
    
}

@property(nonatomic,strong)     NSMutableArray * myBarTitleArray;//导航栏标题v


//导航栏中间标题按钮
@property (nonatomic,strong) UIButton * titleButton;
@property (nonatomic, copy) NSString * titleName;


// arrowImg

@property (nonatomic,strong) UIImageView * imgArrowView;

@property (nonatomic, assign) BOOL isSearchState;



@end

@implementation xiaLaZiDingYiVC


- (NSMutableArray *)myBarTitleArray{
    
    if (!_myBarTitleArray) {
        
        _myBarTitleArray = [NSMutableArray array];
        
    }
    
    return _myBarTitleArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"下拉列表";
    
    [self markInitData];

    
    [self markInitUI];
    
    
    
    
    
    
    

}

- (void)markInitData{

    NSArray *data = @[@"北京",@"上海",@"南京"];
    
    [self.myBarTitleArray addObjectsFromArray:data];
    
    
    
}

- (void)markInitUI{
    
    
    //     下 拉 列表
    
    UIButton *button_down = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_down setTitle:@"自定义的列表" forState:UIControlStateNormal];
    button_down.titleLabel.font = [UIFont systemFontOfSize:14];
    button_down.layer.masksToBounds = YES;
    button_down.layer.cornerRadius = 5;
    
    button_down.layer.borderWidth = 1.f;
    button_down.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_down setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
        [button_down addTarget:self action:@selector(titleSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_down];
    _titleButton = button_down;
    
    
    
    [button_down mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.centerY.equalTo(self.view.mas_centerY);
        
        
    }];
    
    
//    搞个 图片
    
    UIImageView *imgView_arrow = [[UIImageView alloc]init];
    
    [imgView_arrow setImage:[UIImage imageNamed:@"SanJiao.png"]];
    
    imgView_arrow.backgroundColor = [UIColor orangeColor];
    
    imgView_arrow.contentMode = UIViewContentModeScaleToFill;
    imgView_arrow.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickOnImg:)];
    [imgView_arrow addGestureRecognizer:tap];
    
    [self.view addSubview:imgView_arrow];
    _imgArrowView = imgView_arrow;
    self.isSearchState = NO;
    [_imgArrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.equalTo(self.view);

        
    }];
    
    
    
    
    
}

- (void)clickOnImg:(UITapGestureRecognizer *)tap{
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.imgArrowView.transform = CGAffineTransformMakeRotation(M_PI);

        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.1 delay:10 options:0 animations:^{
            
            
            self.imgArrowView.transform = CGAffineTransformIdentity;

            
        } completion:^(BOOL finished) {
            
            
            
        }];
        
    }];
    

    
    
}

- (void)titleSelected:(UIButton *)sender{
    NSLog(@"导航栏标题按钮的点击事件");
    sender.selected = !sender.selected;
    if (sender.selected == YES)
    {
        maskView = [UIView new];
        maskView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        maskView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDismiss)];
        [maskView addGestureRecognizer:tap];
        [self.view addSubview:maskView];
        
        
        alertView = [[DetailTitleView alloc] init];
        alertView.frame = CGRectMake(SCREEN_WIDTH/2-80, -250, 160, 250);
        alertView.datailArray = self.myBarTitleArray;
        
        alertView.delegate = self;
        alertView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        alertView.layer.shadowOffset = CGSizeMake(1, 1);
        alertView.layer.shadowOpacity = 0.7;
        [self.view addSubview:alertView];
        [alertView creatTitleView];
        alertView.userInteractionEnabled = YES;
        [UIView animateWithDuration: 0.5 animations: ^{
            CGRect rect = alertView.frame;
            rect.size.height = 250;
            rect.origin.y = 0;
            alertView.frame = rect;
            imageView.image = [UIImage imageNamed:@"SanJiaoNext.png"];
//            imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI);//旋转180
            imageView.transform = CGAffineTransformMakeRotation(M_PI);
//            imageView.transform = CGAffineTransformIdentity;// 还原
        } completion: nil];
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = alertView.frame;
            rect.size.height = 0;
            rect.origin.y = -250;
            alertView.frame = rect;
            imageView.image = [UIImage imageNamed:@"SanJiao.png"];
        } completion:^(BOOL finished){
            [maskView removeFromSuperview];
            maskView = nil;
            [alertView removeFromSuperview];
            alertView = nil;
        }];
    }
    
    
}



#pragma mark - 导航栏上的标题切换 delegate -------
- (void)changeTitle:(CathecticModel *)title and:(int)index{
    
    NSLog(@"导航栏上的标题切换");
    
    
    CGFloat W = 100;
    
    CGRect rect = self.titleButton.frame;
    rect.size.width = W+50;
    rect.origin.x = 100-W/2-25;


    
    self.titleButton.frame = rect;
    [self.titleButton setTitle:self.titleName forState:0];
    imageView.frame = CGRectMake(self.titleButton.frame.size.width-10, 7.5, 15, 15);


    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = alertView.frame;
        rect.size.height = 0;
        rect.origin.y = -200;
        alertView.frame = rect;
        imageView.image = [UIImage imageNamed:@"SanJiao.png"];
    } completion:^(BOOL finished){
        [maskView removeFromSuperview];
        maskView = nil;
        [alertView removeFromSuperview];
        alertView = nil;
    }];
    

    self.titleButton.enabled = NO;
}


- (void)tapDismiss
{
    if (self.titleButton.selected == YES)
    {
        self.titleButton.selected = !self.titleButton.selected;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = alertView.frame;
            rect.size.height = 0;
            rect.origin.y = -250;
            alertView.frame = rect;
            imageView.image = [UIImage imageNamed:@"SanJiao.png"];
        } completion:^(BOOL finished)
         {
             [maskView removeFromSuperview];
             maskView = nil;
             [alertView removeFromSuperview];
             alertView = nil;
         }];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
