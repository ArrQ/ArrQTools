//
//  LableViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/19.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "LableViewController.h"
#import "UILabel+LableExtentsion.h"
#import <Masonry.h>

@interface LableViewController ()

@end

@implementation LableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    友情提示 ：字体 不能 居中
  //    友情提示 ：字体 不能 居中
    //    友情提示 ：字体 不能 居中
    
    UILabel *lable_000 = [[UILabel alloc]init];
    lable_000.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    lable_000.text = @"娱乐年的娱娱乐年的娱娱乐年的娱";
    lable_000.text = @"娱乐年的娱娱乐年";

    lable_000.text = @"娱乐年的娱";
    lable_000.text = @"12345679";
//    lable_000.text = @"01230456079";

    lable_000.frame = CGRectMake(0, self.view.frame.size.width, self.view.frame.size.width, 14);
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentCenter;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];

    [self.view addSubview:lable_000];


    CGFloat w = self.view.frame.size.width - [self getLableWidth:lable_000 font:14];
    NSString *str = lable_000.text;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSKernAttributeName:@(w/(str.length+1))}];
    lable_000.attributedText = attributedString;
    
    
    
    
//    [UILabel changeWordSpaceForLabel:lable_000 WithSpace:w/(str.length+1)];

    
    
    
    
    
}

/**
 17  *  自动计算label的宽度  前提高度固定
 18  *
 19  */
 - (void)sizeToLabelWidth
 {
           UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
           label.textColor = [UIColor whiteColor];
           label.font = [UIFont systemFontOfSize:13];
           label.numberOfLines = 0; //这个属性 一定要设置为0   0表示自动换行   默认是1 不换行
           label.backgroundColor = [UIColor blackColor];
           label.textAlignment = NSTextAlignmentLeft;
          NSString *str = @"fsdfsfnksdfjsdkhfjksdhfjdolfsdfsfnksdfjsdkhfjksdhfjsdkhfjksdhfjdojdol";


                //第一种方式
                //    CGSize size = [str sizeWithFont:label.font constrainedToSize: CGSizeMake(MAXFLOAT,label.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
     
                //第二种方式
     
               NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
               attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
     
               CGSize size =  [str boundingRectWithSize:CGSizeMake( MAXFLOAT,label.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
     
               label.frame = CGRectMake(5, 0, size.width, 100);
               label.text = str;

       [self.view addSubview:label];
    }


/**
    49  *  自动计算label的高度  前提 ：宽度固定
    50  */
 - (void)sizeToLabelHeight
 {
    
         UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
                  label.textColor = [UIColor whiteColor];
                  label.font = [UIFont systemFontOfSize:13];
                  label.numberOfLines = 0;//这个属性 一定要设置为0   0表示自动换行   默认是1 不换行
                  label.backgroundColor = [UIColor blackColor];
                  label.textAlignment = NSTextAlignmentLeft;
     
        NSString *str = @"fsdfsfnksdfjsdkhfjksdhfjdolfsdfsfnksdfjsdkhfjksdhfjsdkhfjksdhfjdojdol";
  
    //第一种方式
   //    CGSize size = [str sizeWithFont:label.font constrainedToSize: CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
      //第二种方式
       NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
      attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];

     CGSize size =  [str boundingRectWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
 
     label.frame = CGRectMake(100, 100, 100, size.height);
     label.text = str;

     [self.view addSubview:label];
     
     
     
     
     
     
}


- (CGFloat)getLableWidth:(UILabel *)lable font:(NSInteger)fontSize{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
    
    CGSize size =  [lable.text boundingRectWithSize:CGSizeMake( MAXFLOAT,lable.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    
    return size.width;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];



}



@end
