//
//  showdaojishiViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/1/2.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showdaojishiViewController.h"
#import "YYTimeManager.h"
@interface showdaojishiViewController (){
    
    dispatch_source_t _timer;// 计时器

    
    
    //倒计时的时间
    NSInteger countDownTimer;
    
    
}
@property(nonatomic,strong) UILabel *minLabel;
@property(nonatomic,strong) UILabel *fangFa2Label;// 方法2


@end

@implementation showdaojishiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self customUI];

    
    NSString *timestr = [self getTimeStr:@"2018-03-02 15:10:45" withFormate:@"yyyy-MM-dd HH:mm"];
    [self getTimeStart:timestr];// 方法 1
    
    

    
    
    
    
    
    
}

- (void)customUI{
    
    UILabel *lable_title = [[UILabel alloc]init];
    
    lable_title.text = @"娱乐";
    lable_title.frame = CGRectMake(150, 100, 300, 20);
    lable_title.font = [UIFont systemFontOfSize:14];
    lable_title.textAlignment = NSTextAlignmentLeft;
    lable_title.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    [self.view addSubview:lable_title];

    [self getDataMinSec:10 andView:lable_title];
    
    UILabel *lable_2 = [[UILabel alloc]init];
    
    lable_2.text = @"00:00";
    
    lable_2.font = [UIFont systemFontOfSize:14];
    lable_2.textAlignment = NSTextAlignmentCenter;
    lable_2.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    [self.view addSubview:lable_2];
    
    _fangFa2Label = lable_2;
    
    
    
    
    UILabel *lable_000 = [[UILabel alloc]init];
    
    lable_000.text = @"00:00";
 
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentCenter;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    [self.view addSubview:lable_000];

    _minLabel = lable_000;
    
//    int spaTime = 5;
//    countDownTimer = spaTime;
//
    
    
    NSDateFormatter * formater = [[NSDateFormatter alloc]init];
    formater.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formater setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate * getDate = [formater dateFromString:@"2018/03/01 14:12:12"];
    NSTimeInterval b = [getDate timeIntervalSince1970];
    NSTimeInterval a = [[NSDate new] timeIntervalSince1970];//当前秒
    NSInteger spaTime = b-a;//相差多少秒,15秒执行一次上一个刷新请求数据方法
    
    
    
    if (spaTime < 0)
    {
        self.minLabel.text = [NSString stringWithFormat:@"00:00"];
    }else
    {
        //计算分秒
        long Min = spaTime/60;
        long Sec = spaTime%60;
        self.minLabel.text = [self changeShiFenMiao:Min and:Sec];
        
//        计算时分秒

        NSInteger spaTimeNum = 120;
        NSInteger hhNUm = spaTimeNum/3600;
        long MinNum = (spaTimeNum%3600)/60;
        long SecNum = spaTimeNum%60;

        self.minLabel.text = [self getChangeShiFenMiaoWithHh:hhNUm andMin:MinNum andSec:SecNum];

        
    }
    
    
    
    
    
}


// 返回分秒
- (NSString *)changeShiFenMiao:(long)Min and:(long)Sec{
    NSString * M;
    NSString * S;
    if (Min<10)
    {
        M = [NSString stringWithFormat:@"0%ld",Min];
    }else
    {
        M = [NSString stringWithFormat:@"%ld",Min];
    }
    if (Sec<10)
    {
        S = [NSString stringWithFormat:@"0%ld",Sec];
    }else
    {
        S = [NSString stringWithFormat:@"%ld",Sec];
    }
    return [NSString stringWithFormat:@"%@:%@",M,S];
}

// 返回 时分秒

- (NSString *)getChangeShiFenMiaoWithHh:(long)hhNum andMin:(long)MinNum andSec:(long)SecNum{
    
   
    NSString *allTime;

    NSString *hh;
    NSString * M;
    NSString * S;
    
    if (hhNum<10)
    {
        hh = [NSString stringWithFormat:@"0%@",@(hhNum)];
    }else
    {
        hh = [NSString stringWithFormat:@"%@",@(hhNum)];
    }
    if (MinNum<10)
    {
        M = [NSString stringWithFormat:@"0%ld",MinNum];
    }else
    {
        M = [NSString stringWithFormat:@"%ld",MinNum];
    }
    if (SecNum<10)
    {
        S = [NSString stringWithFormat:@"0%ld",SecNum];
    }else
    {
        S = [NSString stringWithFormat:@"%ld",SecNum];
    }
    allTime = [NSString stringWithFormat:@"%@'%@“%@",hh,M,S];
   
    return allTime;
    
    
}

- (void)getTimeStart:(NSString *)strTime{
    
    /*
     
     1.都是 时间戳的情况下  先 转换为  日期 再计算 差值 单位 s
     2.根据 s 转换为 剩余 时间
     
     
     */
    //    NSString *str_now = [NSString getCurrentTimeStr];//获取 当前 时间戳
    
    
    
    //
    NSString *str_now = [self getCurrentTimeStr];// 获取当前时间戳
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[str_now doubleValue]];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[strTime doubleValue]];
    
    NSTimeInterval seconds = [date2 timeIntervalSinceDate:date];
    
    //        根据 描述 计算 剩余时间
    
    NSString *senstr = [NSString stringWithFormat:@"%f",seconds];
    
    
    
    [self openWardCountDown:self.fangFa2Label timeout:senstr];
    
    
    
    
    
    
}
#pragma mark - 根据 时间差 有多少秒 来算 倒计时
- (void)openWardCountDown:(UILabel *)label timeout:(NSString *)timeouts

{
    
    __weak typeof (self) weakSelf = self;
    
    
    __block int timeout = [timeouts intValue];
    
    //NSLog(@"倒计时总时间的秒%d",timeout);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //    创建 类型
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);//每秒执行
    //    逻辑处理 回调
    dispatch_source_set_event_handler(_timer, ^{
        
        if (timeout<=-1) {
            
            dispatch_source_cancel(_timer);// 关闭定时器
            NSLog(@"关闭了");
            
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                label.text = @"等待开奖";
                
                
                
                
             
            });
            
            
        }else {
            
            int minutes = timeout/60;
            
            int seconds = timeout%60;
            
            NSString *strTime = [NSString stringWithFormat:@"%d:%d", minutes, seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                label.text = strTime;
              
            });
            
            timeout--;
            
        }
        
    });
    
    
    dispatch_resume(_timer);// 启动定时器
    
}



# pragma mark ---  时间 处理 ----


//获取当前时间的时间戳
-(NSString*)getCurrentTimeStr{
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return timeString;
}

//获取时间搓
-(NSString *)getTimeStr:(NSString *)time withFormate:(NSString *)timeFormate
{
    NSDateFormatter * dateFormater = [NSDateFormatter new];
    //    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormater setDateFormat:timeFormate];
    
    NSDate * date = [dateFormater dateFromString:time];
    NSString * timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}







- (void)dealloc{
    
    
    _timer = NULL;// 关闭 之后 销毁即可
    NSLog(@"dealloc是否为空%@",_timer);
    
    
}



# pragma mark --- 请求数据
- (void)getDataMinSec:(NSInteger)sec andView:(UILabel *)titleLab{
    
    
    
   
    [[YYTimeManager shareManager] getMoreTimeShowType:0 andSecond:10 andPlayingBlcok:^(NSString *hhStr, NSString *minStr, NSString *secStr) {
        
        titleLab.text = [NSString stringWithFormat:@"'%@' %@",minStr,secStr];

        
    } andFinishCompleted:^(NSInteger lastSecond) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
              [self getDataMinSec:sec andView:titleLab];
            
           });
    }];
    
    
    
//    [[YYTimeManager shareManager] getMoreTimeMsWithSecond:10 andPlayingBlcok:^(NSString *minStr, NSString *secStr) {
//
//        titleLab.text = [NSString stringWithFormat:@"'%@' %@",minStr,secStr];
//
//
//
//    } andFinishCompleted:^(NSInteger lastSecond) {
//
//             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//                                    [self getDataMinSec:sec andView:titleLab];
//
//
//                });
//
//
//    }];
    
  
    
 
    
    
    
    
}



# pragma mark --- layout view
- (void)viewDidLayoutSubviews{
    
    
    [_minLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.centerY.centerX.equalTo(self.view);

        
        
    }];
    
    
    
    [_fangFa2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.left.equalTo(_minLabel.mas_left);
        
        make.bottom.equalTo(_minLabel.mas_bottom).offset(20);

        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
