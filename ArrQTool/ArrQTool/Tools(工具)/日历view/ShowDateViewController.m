//
//  ShowDateViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "ShowDateViewController.h"
#import "HisCalendarView.h"
#import "ToolCalendarView.h"
@interface ShowDateViewController ()
@property(nonatomic,strong) HisCalendarView *hisCalendarView;
@property(nonatomic,strong) ToolCalendarView *toolCalendarView;

@end

@implementation ShowDateViewController

# pragma mark --- 时间 日期 view ---

- (HisCalendarView *)hisCalendarView{
    
    if (!_hisCalendarView) {
        
        _hisCalendarView = [[HisCalendarView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH,40)];
        
        _hisCalendarView.backgroundColor = [UIColor whiteColor];
        
        __weak typeof (self) weakSelf = self;
        _hisCalendarView.blockSelView = ^(BOOL selOrNo) {
            
            [weakSelf getCalendarViewEvent:selOrNo];
            
        };
        
        
    }
    
    
    return _hisCalendarView;
    
    
}
#pragma mark - 时间 日期  弹框
- (void)getCalendarViewEvent:(BOOL)selOrNo{
    
    
    __weak typeof (self) weakSelf = self;
    
    // 创建日历
    if (_toolCalendarView == nil) {
        _toolCalendarView = [[ToolCalendarView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 250)];
        _toolCalendarView.blockStrTime = ^(NSString *strTime) {
            
            weakSelf.hisCalendarView.titleLab.text = [NSString stringWithFormat:@"%@ 开奖结果",strTime];
            
            
            //刷新数据
           
            
        };
        [self.view addSubview:_toolCalendarView];
        self.toolCalendarView.bgView.hidden = YES;
    }
    
    if (self.toolCalendarView.bgView.hidden == NO) {
        self.toolCalendarView.hidden = YES;
        self.toolCalendarView.bgView.hidden = YES;
    }else{
        self.toolCalendarView.hidden = NO;
        self.toolCalendarView.bgView.hidden = NO;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.hisCalendarView];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
