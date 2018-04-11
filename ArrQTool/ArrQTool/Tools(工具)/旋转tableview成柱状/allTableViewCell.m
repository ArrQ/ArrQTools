//
//  allTableViewCell.m
//  TableViewThransform
//
//  Created by ArrQ on 2017/11/25.
//  Copyright © 2017年 bukaopu. All rights reserved.
//

#import "allTableViewCell.h"

@implementation allTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor redColor];
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    UILabel *lable_000 = [[UILabel alloc]init];
    lable_000.frame = CGRectMake(0, 0, 20, 20);
    lable_000.text = @"娱";
    
    
    //    // 记录中心点
    CGPoint pointCenter = lable_000.center;
    lable_000.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    lable_000.frame = CGRectMake(0, 0, 20,20);
    lable_000.center = pointCenter;
    
    lable_000.textColor = [UIColor blackColor];
    [self addSubview:lable_000];
    _lab = lable_000;
    
    
}




@end
