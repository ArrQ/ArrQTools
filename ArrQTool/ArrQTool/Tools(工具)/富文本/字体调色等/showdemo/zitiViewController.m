//
//  zitiViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/11.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "zitiViewController.h"
#import "ManageColorAttributed.h"

@interface zitiViewController ()

@end

@implementation zitiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lable_000 = [[UILabel alloc]init];
    lable_000.frame = CGRectMake(50, 100, 300, 20);
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentLeft;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    lable_000.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    NSArray *dataall = @[@"娱",@"乐",@"天",@"地",@"天",@"中",@"地"];
    
    NSString *str = [dataall componentsJoinedByString:@","];
    NSArray *data = [str componentsSeparatedByString:@","];
    NSMutableArray *cellarr = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableArray *cellarr_000 = [NSMutableArray arrayWithCapacity:0];
    
    for (NSString *titleStr in data) {
        
        if ([titleStr containsString:@"天"]) {
            
            [cellarr addObject: titleStr];
            
        }
        if ([titleStr containsString:@"地"]) {
            
            [cellarr_000 addObject: titleStr];
            
        }
        
        
        
    }
    
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] init];
    
    //    NSMutableAttributedString *AAAAStr  = [ManageColorAttributed changeTextColorWithColor:[UIColor redColor] string:str andSubString:cellarr colorTwo:[UIColor orangeColor] andSubTwoString:cellarr_000];
    
    
    NSMutableAttributedString *AAAAStr  = [ManageColorAttributed getThreeTextColorWithColor:[UIColor redColor] string:str andSubString:cellarr colorTwo:[UIColor orangeColor] andSubTwoString:cellarr_000 andthreeString:nil colorThree:nil];
    
    
    
    
    //
    //     NSMutableAttributedString *AAAAStr  = [ManageColorAttributed changeFontAndColor:[UIFont systemFontOfSize:14] Color:[UIColor redColor] TotalString:str SubStringArray:cellarr];
    //
    //
    //    [ManageColorAttributed changeFont:[UIFont systemFontOfSize:14] Color:[UIColor blueColor] WithAttributedString:AAAAStr WithOriginString:str SubString:@"娱"];
    //
    //    [ManageColorAttributed changeFont:[UIFont systemFontOfSize:14] Color:[UIColor orangeColor] WithAttributedString:AAAAStr WithOriginString:str SubString:@"地"];
    //
    //    [ManageColorAttributed changeFont:[UIFont systemFontOfSize:14] Color:[UIColor greenColor] WithAttributedString:AAAAStr WithOriginString:str SubString:@"中"];
    
    
    //
    //    attrStr  = [ManageColorAttributed changeTextColorWithColor:[UIColor redColor] string:str andSubString:cellarr];
    //
    //    attrStr  = [ManageColorAttributed changeTextColorWithColor:[UIColor blueColor] string:str andSubString:cellarr_000];
    
    lable_000.attributedText = AAAAStr;
    
    //
    //    lable_000.attributedText = [ManageColorAttributed changeTextColorWithColor:[UIColor redColor] string:str andSubString:cellarr];
    //
    //    lable_000.attributedText = [ManageColorAttributed changeTextColorWithColor:[UIColor blueColor] string:str andSubString:cellarr_000];
    
    [self.view addSubview:lable_000];
    
    
    
    
    
    
    
    
    
    
    
}


@end
