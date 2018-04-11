//
//  showAnimationVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/23.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showAnimationVC.h"

@interface showAnimationVC ()



// arrowImg

@property (nonatomic,strong) UIImageView * imgArrowView;

@property (nonatomic, assign) BOOL isSearchState;


@end

@implementation showAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];


    [self markInitUI];

}

- (void)markInitUI{
    
    
   
    
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
