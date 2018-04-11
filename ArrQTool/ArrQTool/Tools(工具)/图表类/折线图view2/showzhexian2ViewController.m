//
//  showzhexian2ViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/29.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "showzhexian2ViewController.h"
#import "DVLineChartView.h"
#import "UIView+Extension.h"

@interface showzhexian2ViewController ()

@property(nonatomic,assign) CGFloat yMaxValue;

@property (nonatomic,strong) NSMutableArray * XTitleArray;

@end

@implementation showzhexian2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _yMaxValue = 12;
    
    
    [self customUI];


}

- (void)customUI{
    
    
    
    DVLineChartView *header = [[DVLineChartView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 300)];
    
    
    [self.view addSubview:header];
    
    //header.width = view.frame.size.width;
    //y轴与左侧的间距
    header.yAxisViewWidth = 25;//25
    //y轴分为几段(默认5)
    
    if (_yMaxValue < 9) {
        header.numberOfYAxisElements = (int)_yMaxValue;
    }else{
        header.numberOfYAxisElements = 9;
    }
    
    
    
    //header.delegate = self;
    header.pointUserInteractionEnabled = YES;
    //y轴的最大值
    //header.yAxisMaxValue = 9;
    header.yAxisMaxValue = _yMaxValue;
    
    
    //点与点之间的间距
    header.pointGap = 28;
    
    header.showSeparate = YES;
    //分割线颜色
    header.separateColor = [UIColor colorWithRed:207/255.0 green:208/255.0 blue:209/255.0 alpha:1.0];
    //文字颜色
    header.textColor = [UIColor blackColor];
    //背景颜色
    header.backColor = [UIColor whiteColor];
    //坐标轴颜色
    header.axisColor = [UIColor colorWithRed:221/255.0 green:65/255.0 blue:69/255.0 alpha:1.0];
    
    header.xAxisTitleArray = @[@"831", @"832", @"833", @"834", @"835", @"836", @"837", @"838", @"839", @"840", @"841", @"842"];
    
//    header.xAxisTitleArray = [[_XTitleArray reverseObjectEnumerator] allObjects];
    
    header.x = 0;
    header.y = 60;
    header.width = self.view.frame.size.width;
    header.height = 300;
    
    
    
    DVPlot *plot = [[DVPlot alloc] init];
    plot.pointArray = @[@3, @6, @5, @2, @4, @8, @1, @1, @5, @5, @9, @5];
//    plot.pointArray = [[_pointArray reverseObjectEnumerator] allObjects];
    
    //线的颜色
    
    plot.lineColor = [UIColor colorWithRed:245/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    //点的颜色
    
    plot.pointColor = [UIColor colorWithRed:219/255.0 green:5/255.0 blue:21/255.0 alpha:1.0];
    plot.chartViewFill = YES;
    plot.withPoint = YES;
    
    [header addPlot:plot];
    [header draw];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
