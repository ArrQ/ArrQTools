//
//  danxuanCell.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/3.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "danxuanCell.h"
#import "DanXuanCellView.h"

@interface danxuanCell ()

@property(nonatomic,strong) DanXuanCellView *haomaview;

@end


@implementation danxuanCell


- (void)cellWithData:(NSDictionary *)dic andXuanHaoMoShi:(NSArray *)xuanhaomoshi andBlock:(void (^)(NSArray *))result{
    
    
    [self.haomaview showView:xuanhaomoshi block:^(NSArray *dataArray) {
        
        
        result(dataArray);
        
        
    }];
    
    
    
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    
    _haomaview = [[DanXuanCellView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];

    
    [self addSubview:_haomaview];
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
   
    
}

@end
