//
//  HMzsHeaderView.m
//  lottery86
//
//  Created by ArrQ on 2017/12/5.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "HMzsHeaderView.h"
@interface HMzsHeaderView ()<PXLineChartViewDelegate>

@property (nonatomic, strong) PXLineChartView *pXLineChartView;
@property (nonatomic, strong) NSArray *lines;//line count
@property (nonatomic, strong) NSArray *xElements;//x轴数据
@property (nonatomic, strong) NSArray *yElements;//y轴数据

@end

@implementation HMzsHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    UILabel *lable_time = [[UILabel alloc]init];
    
    lable_time.font = [UIFont systemFontOfSize:14];
    lable_time.textAlignment = NSTextAlignmentCenter;
    lable_time.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    [self addSubview:lable_time];

    _timeLab = lable_time;
    
//    _timeLab.text = [NSString getCurrentTimesWithFormate:@"yyyy-MM-dd HH:mm"];
    
    
    UILabel *lable_title = [[UILabel alloc]init];
    
    lable_title.font = [UIFont systemFontOfSize:17];
    lable_title.textAlignment = NSTextAlignmentCenter;
    lable_title.textColor = [UIColor blackColor];
    [self addSubview:lable_title];
    
    _titleLab = lable_title;
    
    _titleLab.text = @"万位走势";
    
    
    
    
    
    
    
    
    _xElements = @[@"012",@"013",@"014",@"015",@"016",@"017",@"018",@"019",@"020",@"021",@"022",@"023"];
    
    //Y轴坐标值要在原来的基础上在增加一个  例如： 最大值是 9 要把 9 + 1 存一下
    _yElements = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"20",@"10"];
    
    self.lines = [self lines:YES];
    

    _pXLineChartView = [[PXLineChartView alloc]init];
    _pXLineChartView.delegate = self;
    [self addSubview:_pXLineChartView];
    

    
    
}



# pragma mark --- 折线 delegate ----


- (NSArray *)lines:(BOOL)fill {
    
    NSArray *pointsArr = @[@{@"xValue" : @"012", @"yValue" : @"0"},
                           @{@"xValue" : @"013", @"yValue" : @"2"},
                           @{@"xValue" : @"014", @"yValue" : @"5"},
                           @{@"xValue" : @"015", @"yValue" : @"6"},
                           @{@"xValue" : @"016", @"yValue" : @"4"},
                           @{@"xValue" : @"017", @"yValue" : @"2"},
                           @{@"xValue" : @"018", @"yValue" : @"3"},
                           @{@"xValue" : @"019", @"yValue" : @"7"},
                           @{@"xValue" : @"020", @"yValue" : @"8"},
                           @{@"xValue" : @"021", @"yValue" : @"1"},
                           @{@"xValue" : @"022", @"yValue" : @"3"},
                           @{@"xValue" : @"023", @"yValue" : @"9"},
        
                           ];
 
    NSMutableArray *points = @[].mutableCopy;
    for (int i = 0; i < pointsArr.count; i++) {
        PointItem *item = [[PointItem alloc] init];
        NSDictionary *itemDic = pointsArr[i];
        item.price = itemDic[@"yValue"];
        item.time = itemDic[@"xValue"];
        item.chartLineColor = [UIColor blueColor];
        item.pointValueColor = [UIColor blackColor];
        
        if (i == 0) {
            
            item.chartPointColor = [UIColor orangeColor];

            
        }else{
            
            
            item.chartPointColor = [UIColor redColor];

        }
        
        if (fill) {
            //折线填充区域颜色
            item.chartFillColor = [UIColor colorWithRed:244/255.0 green:220/255.0 blue:220/255.0 alpha:0.8];
        
            //kRGBColor(246, 220, 222);
            item.chartFill = YES;
        }
        [points addObject:item];
    }


    return @[points];
    
    
}

#pragma mark PXLineChartViewDelegate
//通用设置
- (NSDictionary<NSString*, id> *)lineChartViewAxisAttributes {
    return @{yElementInterval : @"20",
             xElementInterval : @"25",
             yMargin : @"25",
             xMargin : @"30",
             yAxisColor : [UIColor redColor],
             xAxisColor : [UIColor redColor],// x 坐标轴 线 的颜色
             gridColor : [UIColor colorWithRed:202/255.0 green:203/255.0 blue:204/255.0 alpha:1.0],// 浅灰色
             gridHide : @"0",
             pointHide : @"0",
             pointFont : [UIFont systemFontOfSize:10],
             firstYAsOrigin : @"1",
             scrollAnimation : @"0",
             scrollAnimationDuration : @"2"};
}
//line count
- (NSUInteger)numberOfChartlines {
    return self.lines.count;
}
//x轴y轴对应的元素count
- (NSUInteger)numberOfElementsCountWithAxisType:(AxisType)axisType {
    return (axisType == AxisTypeY)? _yElements.count : _xElements.count;
}
//x轴y轴对应的元素view
- (UILabel *)elementWithAxisType:(AxisType)axisType index:(NSUInteger)index {
    UILabel *label = [[UILabel alloc] init];
    NSString *axisValue = @"";
    if (axisType == AxisTypeX) {
        axisValue = _xElements[index];
        label.textAlignment = NSTextAlignmentCenter;//;
    }else if(axisType == AxisTypeY){
        axisValue = _yElements[index];
        label.textAlignment = NSTextAlignmentRight;//;
    }
    label.text = axisValue;
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blackColor];
    return label;
}
//每条line对应的point数组
- (NSArray<id<PointItemProtocol>> *)plotsOflineIndex:(NSUInteger)lineIndex {
    return self.lines[lineIndex];
}
//点击point回调响应
- (void)elementDidClickedWithPointSuperIndex:(NSUInteger)superidnex pointSubIndex:(NSUInteger)subindex {
    PointItem *item = self.lines[superidnex][subindex];
    NSString *xTitle = item.time;
    NSString *yTitle = item.price;
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:yTitle
                                                                       message:[NSString stringWithFormat:@"x：%@ \ny：%@",xTitle,yTitle] preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
//    [self presentViewController:alertView animated:YES completion:nil];
}

//static bool fill = NO;
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    fill = !fill;
//    self.lines = [self lines:fill];
//    [_pXLineChartView reloadData];
//}




# pragma mark --- layout view ----
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top).offset(10);
        
        make.centerX.equalTo(self.mas_centerX);

        
    }];
    
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_timeLab.mas_bottom).offset(10);
        
        make.centerX.equalTo(self.mas_centerX);
        
        
    }];
    
    
    [_pXLineChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 250));
        
        make.bottom.equalTo(self.mas_bottom).offset(-20);
        make.centerX.equalTo(self.mas_centerX);
        
    }];
    
    
    
}



@end
