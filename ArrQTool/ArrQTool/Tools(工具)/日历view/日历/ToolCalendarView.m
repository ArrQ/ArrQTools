//
//  ToolCalendarView.m
//  lottery86
//
//  Created by ArrQ on 2017/11/24.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "ToolCalendarView.h"



#import "HisCalendarView.h"

#define history_titleDate  [UIColor colorFromHexRGB:@"564d45"]

#define dateHeaderTitleColor [UIColor colorFromHexRGB:@"C50B19"]

#define dateWeekdayTextColor [UIColor colorFromHexRGB:@"757575"]
#define dateWeekOneBgColor [UIColor colorFromHexRGB:@"F2F2F2"]

#define dateTitleDefaultColor [UIColor colorFromHexRGB:@"AF2F38"]
#define dateSelectionColor [UIColor colorFromHexRGB:@"AAAAAA"]
#define dateTodayColor [UIColor colorFromHexRGB:@"43AFCB"]
#define datetitlePlaceholderColor [UIColor colorWithWhite:0.9 alpha:1.0]

@interface ToolCalendarView ()

@property(nonatomic,strong) HisCalendarView *headerCalendarView;

@end


@interface ToolCalendarView ()<FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance>

@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UIButton *leftButton;
@property (weak, nonatomic) UIButton *rightButton;
@property (strong, nonatomic) NSCalendar *gregorian;

@property(nonatomic,strong) UIView *bottomView;
@property(nonatomic,strong) UILabel *lineLab;
@property(nonatomic,strong) UIButton *suerBtn;
@property(nonatomic,strong) UIButton *noSuerBtn;

@property(nonatomic,strong) NSString *strDate;
@end

@implementation ToolCalendarView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.bgView.hidden = NO;

        self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (UIControl *)bgView{
    if (!_bgView) {
        _bgView = [[UIControl alloc]initWithFrame:CGRectMake(0, 64+40*2, SCREEN_WIDTH, SCREEN_HEIGHT-64-40*2)];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        _bgView.hidden = YES;
        [_bgView addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgView];
        [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
    }
    return _bgView;
}
- (void)hide{
    
    self.hidden = YES;
    
    self.bgView.hidden = YES;
    
}

- (void)customSubViews{
    
    
    _headerCalendarView = [[HisCalendarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    _headerCalendarView.backgroundColor = [UIColor whiteColor];
    _headerCalendarView.titleLab.textColor = history_titleDate;

    __weak typeof (self) weakSelf = self;
    _headerCalendarView.blockSelView = ^(BOOL selOrNo) {
      
        [weakSelf.headerCalendarView.arrowImgView setImage:[UIImage imageNamed:@"HisCalendar_arrow_up"]];
        [weakSelf hide];
        
    };
    [self.bgView addSubview:_headerCalendarView];

    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0+40, SCREEN_WIDTH, 200)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.appearance.headerMinimumDissolvedAlpha = 0;
    calendar.appearance.headerTitleColor = dateHeaderTitleColor;
    calendar.appearance.headerDateFormat = @"yyyy年 MM月";
    calendar.appearance.subtitleWeekendColor = [UIColor greenColor];
    calendar.appearance.weekdayTextColor = dateWeekdayTextColor;
    calendar.appearance.titleDefaultColor = dateTitleDefaultColor;
    
    calendar.appearance.eventSelectionColor = [UIColor greenColor ];
    calendar.appearance.selectionColor = dateSelectionColor;
    calendar.appearance.todayColor = dateTodayColor;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesDefaultCase|FSCalendarCaseOptionsWeekdayUsesUpperCase;
    calendar.appearance.titlePlaceholderColor = datetitlePlaceholderColor;
    calendar.placeholderType = FSCalendarPlaceholderTypeNone;
//    calendar.allowsMultipleSelection = YES;

    calendar.scope = FSCalendarScopeMonth;
    calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
    //    calendar.today = nil;// 设置 今天 外观
    calendar.firstWeekday = 1;
    [self.bgView addSubview:calendar];
    _calendar = calendar;
    
    
    
    
//     处理 左右 反页
    UIButton *previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    previousButton.frame = CGRectMake(100,40+5, 20, 20);
//    previousButton.backgroundColor = [UIColor whiteColor];
    previousButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [previousButton setImage:[UIImage imageNamed:@"calender_arrow_left"] forState:UIControlStateNormal];
    [previousButton addTarget:self action:@selector(previousClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:previousButton];
    _leftButton = previousButton;
//    _leftButton.hidden = YES;

    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    nextButton.frame = CGRectMake(280,40+5, 20, 20);
//    nextButton.backgroundColor = [UIColor whiteColor];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [nextButton setImage:[UIImage imageNamed:@"calender_arrow_right"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:nextButton];
    _rightButton = nextButton;

//    _rightButton.hidden = YES;
    
    
    UIView *bototmview = [[UIView alloc]init];
    
    bototmview.backgroundColor = [UIColor whiteColor];
    
    [self.bgView addSubview:bototmview];
    _bottomView = bototmview;
    
//    UILabel *lable_line = [[UILabel alloc]init];
//    lable_line.frame = CGRectMake(0,28, SCREEN_WIDTH, 1);
//    lable_line.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
//    [_calendar addSubview:lable_line];

    
    UIButton *button_nosure = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_nosure setTitle:@"取消" forState:UIControlStateNormal];
    [button_nosure setTitleColor:[UIColor whiteColor] forState:0];
    button_nosure.titleLabel.font = [UIFont systemFontOfSize:17];
    button_nosure.layer.masksToBounds = YES;
    button_nosure.layer.cornerRadius = 20;
    button_nosure.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [button_nosure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_nosure addTarget:self action:@selector(noSureBtn:) forControlEvents:UIControlEventTouchUpInside];

    [_bottomView addSubview:button_nosure];
    
    _noSuerBtn = button_nosure;
    
    UIButton *button_sure = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_sure setTitle:@"确定" forState:UIControlStateNormal];
    [button_sure setTitleColor:[UIColor whiteColor] forState:0];
    button_sure.titleLabel.font = [UIFont systemFontOfSize:17];
    button_sure.layer.masksToBounds = YES;
    button_sure.layer.cornerRadius = 20;
    button_sure.backgroundColor = [UIColor redColor];
    [button_sure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_sure addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:button_sure];
    
    _suerBtn = button_sure;

  
    
}

- (void)previousClicked:(id)sender
{
    NSDate *currentMonth = self.calendar.currentPage;
    NSDate *previousMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:currentMonth options:0];
    [self.calendar setCurrentPage:previousMonth animated:YES];
}

- (void)nextClicked:(id)sender
{
    NSDate *currentMonth = self.calendar.currentPage;
    NSDate *nextMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:currentMonth options:0];
    [self.calendar setCurrentPage:nextMonth animated:YES];
}

- (void)sureBtn:(UIButton *)sender{
    
//    这里 传值 就好了 啊
 
    
    if (self.blockStrTime) {
        
        self.headerCalendarView.titleLab.text = [NSString stringWithFormat:@"%@ 开奖结果",self.strDate];

        self.blockStrTime(self.strDate);
        
    }
    
    
    [self hide];
    
    
    
    
}

- (void)noSureBtn:(UIButton *)sender{
    
    
    [self hide];
    
    
    
    
}



# pragma mark --- delegate ---


- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    
    NSLog(@"%@",date);

    self.strDate = [self getStrTime:date];
    
    
    [calendar reloadData];
    
    NSLog(@"点击了日期。。。。。。。。");
    
    
    
    
    
}

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    
//    if ([self isThisMonth:date]) {
//
//        return  YES ;
//    }
//    return  NO ;
//
    
    if ([self compareOneDay:[self getCurrentTime] withAnotherDay:date]>0) {
        
        return  YES ;
    }else{
        
        
        if (self.blockDateSelNo) {
            
            self.blockDateSelNo(nil);
            
        }
        
        
        XSInfoViewStyle *info = [[XSInfoViewStyle alloc]init];
        info.info = @"该日期暂未开奖";
        [XSInfoView getShowInfoWithStyle:info onView:self.bgView andHeightToTop:-self.frame.size.height/2];
        
        
    }
    return  NO ;
    
    
    
    
    
}


/**
 *  是否为本月
 */
- (BOOL)isThisMonth:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitMonth;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:date];
    
    return nowCmps.month == selfCmps.month;
}



- (NSString *)getStrTime:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormatter stringFromDate:date];
    
    
}

//  日期 比较

#pragma mark -得到当前时间
- (NSDate *)getCurrentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    
    NSLog(@"---------- currentDate == %@",date);
    return date;
}

// 获取 指定日期
- (NSDate *)getNextTime:(NSString *)otherTime{// 可能是 字符串
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSDate *date = [dateFormatter dateFromString:otherTime];
    
    
    return date;
    
}

// 如果没达到指定日期，返回-1，刚好是这一时间，返回0，否则返回1
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;  // 指定 时间是 昨天
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;// 指定 时间 是 今天
    
//    >0  之前
    
//    [self compareOneDay:[self getCurrentTime] withAnotherDay:date]

    
}





# pragma mark --- layoutview ----
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(self.bgView.mas_centerX).offset(-80);
        make.top.equalTo(self.bgView.mas_top).offset(40+8);


    }];


    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.bgView.mas_right).offset(-100);
        
        make.centerX.equalTo(self.bgView.mas_centerX).offset(80);

        make.centerY.equalTo(self.leftButton.mas_centerY);
    }];

    
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 100));
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(self.calendar.mas_bottom);

    }];
    
    
    
    
//
//    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.height.mas_equalTo(0.5);
//        make.right.left.equalTo(self.bottomView);
//        make.bottom.equalTo(self.calendar.mas_top).offset(30);
//
//    }];
//
    
    
    
    [_noSuerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
     
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH - 70)/2, 44));
        make.left.equalTo(self.bottomView.mas_left).offset(20);
        make.centerY.equalTo(self.bottomView.mas_centerY);

    }];
    
    
    
    
    
    
    [_suerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH - 70)/2, 44));

        make.left.equalTo(self.noSuerBtn.mas_right).offset(30);

        make.centerY.equalTo(self.noSuerBtn.mas_centerY);

        
    }];
    
    
}


@end
