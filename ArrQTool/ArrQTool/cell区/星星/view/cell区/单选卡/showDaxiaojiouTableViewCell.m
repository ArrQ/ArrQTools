//
//  showDaxiaojiouTableViewCell.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showDaxiaojiouTableViewCell.h"

#import "yyshowquandaxiaoView.h"


@interface showDaxiaojiouTableViewCell ()

@property(nonatomic,strong) yyshowquandaxiaoView *haomaview;

@end


@implementation showDaxiaojiouTableViewCell


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
    

    _haomaview = [[yyshowquandaxiaoView alloc]initWithFrame:CGRectMake(60, 0, SCREEN_WIDTH-60, 40)];
    
    
    [self addSubview:_haomaview];
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    
}

@end
