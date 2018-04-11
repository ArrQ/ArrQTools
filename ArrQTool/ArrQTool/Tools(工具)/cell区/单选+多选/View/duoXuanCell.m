//
//  duoXuanCell.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/3.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "duoXuanCell.h"


#import "DuoXuanShuZuView.h"

@interface duoXuanCell ()

@property(nonatomic,strong) DuoXuanShuZuView *haomaview;
@property(nonatomic,copy) void (^block)(NSArray *dataArray);

@end


@implementation duoXuanCell


- (void)cellWithData:(NSDictionary *)dic andXuanHaoMoShi:(NSArray *)xuanhaomoshi andBlock:(void (^)(NSArray *))result{
    
    self.block = result;
    
    [self.haomaview showView:xuanhaomoshi block:^(NSArray *dataArray) {
        
        
        if (self.block) {
            
            self.block(dataArray);
            
        }
        
        
    }];
    
    
    
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    
    _haomaview = [[DuoXuanShuZuView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    
    
    [self addSubview:_haomaview];
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    
}

@end

