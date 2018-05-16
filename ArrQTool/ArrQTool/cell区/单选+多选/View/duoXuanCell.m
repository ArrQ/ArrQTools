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

@end


@implementation duoXuanCell

- (void)cellWithData:(NSDictionary *)dic andIndexPath:(NSIndexPath *)indexPath andXuanHaoMoShi:(NSArray *)xuanhaomoshi andBlock:(void (^)(NSArray *))result{
    
   
    [self.haomaview showView:xuanhaomoshi andIndexPath:indexPath block:^(NSArray *dataArray) {
        
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
    
    
    
    _haomaview = [[DuoXuanShuZuView alloc]initWithFrame:CGRectMake(60, 0, SCREEN_WIDTH-60, self.frame.size.height)];


    [self addSubview:_haomaview];
    
}





- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    
}

@end

