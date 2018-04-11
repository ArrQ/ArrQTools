//
//  showYanZhengMaVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/2.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showYanZhengMaVC.h"

@interface showYanZhengMaVC (){
    UIButton *_getNumBtn;
}

@end

@implementation showYanZhengMaVC

- (void)viewDidLoad {
    [super viewDidLoad];


    [self getbtn];
    
}

- (void)getbtn{
    
    _getNumBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _getNumBtn.frame=CGRectMake(50, 200, 200, 50);
//    [_getNumBtn setBackgroundImage:[UIImage imageNamed:@"bg_send_validate_code.png"] forState:UIControlStateNormal];
    
    
    _getNumBtn.backgroundColor = [UIColor blueColor];
    [_getNumBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getNumBtn addTarget:self action:@selector(getBtnyanzhengma) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getNumBtn];
    
    
}

# pragma mark --- 获取 倒计时 ----

- (void)getBtnyanzhengma{
    
    
    
    __block NSInteger second = 60;
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                [_getNumBtn setTitle:[NSString stringWithFormat:@"(%ld)重发验证码",second] forState:UIControlStateNormal];
                second--;
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                [_getNumBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                
            }
        });
        
    });
    //启动源
    dispatch_resume(timer);

    
    
    
    
}





# pragma mark ---小时 天数 的 计算

- (void)getTime{
    
    
    
    
    
        NSDate *date = [NSDate date];
        NSInteger timeInterval = [date timeIntervalSince1970];// 现在的 时间戳 s 秒
    
        NSString *allTime;
    
        NSString  *timeStr = @"15189898945";// 获取的 时间戳的 时间戳

    
        NSInteger new = [timeStr integerValue] - timeInterval;
    
        NSInteger newtime = ([timeStr integerValue] - timeInterval)/60/60;// 小时
    
        if (newtime<24) {
    
            allTime = [NSString stringWithFormat:@"(剩余%ld小时)",newtime];
    
    
        }else{
    
    
            allTime = [NSString stringWithFormat:@"(剩余%ld天)",newtime/24];
    
    
        }
    
    
    
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
