//
//  HelpViewController.m
//  lottery86
//
//  Created by ArrQ on 2017/11/24.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "HelpViewController.h"
#import <WebKit/WebKit.h>

#define naviBackImg [UIImage imageNamed:@"return"]

@interface HelpViewController ()<WKNavigationDelegate,WKUIDelegate>
@property(nonatomic,strong) WKWebView *wkWebView;
@property (nonatomic,strong) UIProgressView *progress;

@end

@implementation HelpViewController

- (void)viewWillAppear:(BOOL)animated{
    
    if ([self.typeID integerValue] == 1) {// 本地 html URL
        
        NSURL *filePath = [[NSBundle mainBundle] URLForResource:@"bjpk_yxgz.html" withExtension:nil];
        NSURLRequest *request = [NSURLRequest requestWithURL:filePath];
        
        [self.wkWebView loadRequest:request];
        
        
    }else if ([self.typeID integerValue] == 2){// html 代码
        
        NSString *strUrl = [NSString stringWithFormat:@"%@",self.typeStr];
        
        [self.wkWebView loadHTMLString:strUrl baseURL:nil];
        
        
    }else if ([self.typeID integerValue] == 3){ // URL
        
        
        NSString *str = [NSString stringWithFormat:@"%@",self.typeStr];
        
        NSURL *url = [NSURL URLWithString:self.typeStr];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.wkWebView loadRequest:request];
        
    }
    
    
    
    //，获得页面title和加载进度值
    [self.wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [self.wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    
    
    
    
    
}


#pragma 以二进制数据的形式加载文件
- (void)loadDataFile  {
    // 最最常见的一种情况
    // 打开IE,访问网站,提示你安装Flash插件
    // 如果没有这个应用程序,是无法用UIWebView打开对应的文件的
    
    // 应用场景:加载从服务器上下载的文件,例如pdf,或者word,图片等等文件
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"iOS 7 Programming Cookbook.pdf" withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
    // 服务器的响应对象,服务器接收到请求返回给客户端的
    NSURLResponse *respnose = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&respnose error:NULL];
    
    NSLog(@"%@", respnose.MIMEType);
    
    // 在iOS开发中,如果不是特殊要求,所有的文本编码都是用UTF8
    // 先用UTF8解释接收到的二进制数据流
//    [self.wkWebView loadData:data MIMEType:respnose.MIMEType textEncodingName:@"UTF8" baseURL:nil];
    
    if (@available(iOS 9.0, *)) {
        [self.wkWebView loadData:data MIMEType:respnose.MIMEType characterEncodingName:@"UTF8" baseURL:nil];
    } else {
        // Fallback on earlier versions
    }
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [self customNavi];
    [self customTableview];
    


}


# pragma mark ---  适应 高度 ---
- (void)customTableview{
    
    if (@available(iOS 11.0, *)) {
        
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        
        
    } else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    
    
}


# pragma mark --- 加返回按钮 ---
- (void)customNavi{
    
    
    
    CGFloat btnWidth = 30,btnHeight = 44,imgMagin = 10;
    
    
    UIView *view_left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    
    UIButton *button_left = [UIButton buttonWithType:UIButtonTypeCustom];
    button_left.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    button_left.imageEdgeInsets = UIEdgeInsetsMake(0, -imgMagin, 0, 0);
    [button_left addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button_left setImage:naviBackImg forState:0];
    [view_left addSubview:button_left];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:view_left];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)leftBtn:(UIButton *)sender{
    
    
    if ([_wkWebView canGoBack]) {
        [self.wkWebView goBack];
        
    }else{
        [self.view resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}






#pragma mark 加载进度条
- (UIProgressView *)progress
{
    if (_progress == nil)
    {
        _progress = [[UIProgressView alloc]initWithFrame:CGRectMake(0, Frank_StatusAndNavBar_Height, SCREEN_WIDTH, 2)];
        _progress.tintColor = [UIColor blueColor];
        _progress.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_progress];
    }
    return _progress;
}



- (WKWebView *)wkWebView{
    
    
    if (_wkWebView == nil)
    {
        _wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, Frank_StatusAndNavBar_Height, SCREEN_WIDTH, SCREEN_HEIGHT-Frank_StatusAndNavBar_Height)];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        _wkWebView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_wkWebView];
    }
    return _wkWebView;
    
  
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];



}

#pragma mark KVO的监听代理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    //加载进度值
    if ([keyPath isEqualToString:@"estimatedProgress"])
    {
        if (object == self.wkWebView)
        {
            [self.progress setAlpha:1.0f];
            [self.progress setProgress:self.wkWebView.estimatedProgress animated:YES];
            if(self.wkWebView.estimatedProgress >= 1.0f)
            {
                [UIView animateWithDuration:0.5f
                                      delay:0.3f
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     [self.progress setAlpha:0.0f];
                                 }
                                 completion:^(BOOL finished) {
                                     [self.progress setProgress:0.0f animated:NO];
                                 }];
            }
        }
        else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    //网页title
    else if ([keyPath isEqualToString:@"title"])
    {
        if (object == self.wkWebView)
        {
            self.title = self.wkWebView.title;
        }
        else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark 移除观察者
- (void)dealloc
{
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
}
@end


