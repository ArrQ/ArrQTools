//
//  showxiangceViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/24.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showxiangceViewController.h"

#import "SelectPhotoManager.h"

@interface showxiangceViewController ()
@property(nonatomic,strong) UIImageView *headerImage;
@property (nonatomic, strong) SelectPhotoManager *photoManager;
@end

@implementation showxiangceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIImageView *imgView_ = [[UIImageView alloc]init];
    imgView_.frame = CGRectMake(100, 100, 120, 120);
    [imgView_ setImage:[UIImage imageNamed:@"xiangce_000"]];
    imgView_.contentMode = UIViewContentModeScaleToFill;
    
//    imgView_.backgroundColor = [UIColor orangeColor];
    
    imgView_.layer.masksToBounds = YES;
    
    imgView_.layer.cornerRadius = 60/2;
    
    imgView_.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgClick:)];
    [imgView_ addGestureRecognizer:tap];
    
    [self.view addSubview:imgView_];

    _headerImage = imgView_;
    
    
    UIImage *img = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"headerImage"]];
    if (img) {
        _headerImage.image = img;
    }
    

}





//头像点击事件
-(void)imgClick:(UITapGestureRecognizer *)recognizer{
    
    if (!_photoManager) {
        _photoManager =[[SelectPhotoManager alloc]init];
    }
    [_photoManager startSelectPhotoWithImageName:@"选择头像"];
    __weak typeof(self)mySelf=self;
    //选取照片成功
    _photoManager.successHandle=^(SelectPhotoManager *manager,UIImage *image){
        
        mySelf.headerImage.image = image;
        //保存到本地
        NSData *data = UIImagePNGRepresentation(image);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"headerImage"];
    };
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
