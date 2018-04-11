//
//  WebPageViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/27.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "WebPageViewController.h"
#import "WYWebProgressLayer.h"
#import <WebKit/WebKit.h>
@interface WebPageViewController ()<WKNavigationDelegate>
{
    WYWebProgressLayer *_progressLayer; ///< 网页加载进度条
}
@property (nonatomic, strong) WKWebView * webMyView;

@end

@implementation WebPageViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:21.0]}];
}
- (void)viewWillDisappear:(BOOL)animated
{
}
- (WKWebView *)webMyView
{
    if (!_webMyView)
    {
        _webMyView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49-64)];// 这里 要适应 iPhone 11
        _webMyView.navigationDelegate = self;
        _progressLayer = [WYWebProgressLayer new];
        _progressLayer.frame = CGRectMake(0, -1, SCREEN_WIDTH, 2);
        [_webMyView.layer addSublayer:_progressLayer];
    }
    return _webMyView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self backButton];
    [self loadString:self.strLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)backButton
{
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 0, 20, 20);
    [backButton setBackgroundImage:[UIImage imageNamed:@"basic_btn_back.png"] forState:0];
    [backButton setBackgroundColor:[UIColor clearColor]];
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * tiem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, tiem, nil];
}
- (void)back:(UIBarButtonItem *)btn
{
    if ([_webMyView canGoBack]) {
        [self.webMyView goBack];
        
    }else{
        [self.view resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
// WKNavigationDelegate 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [_progressLayer startLoad];
}
// WKNavigationDelegate 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    //navigationAction.request.URL.host
    NSLog(@"WKwebView ... didCommitNavigation ..");
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:
(WKNavigationAction *)navigationAction decisionHandler:
(void (^)(WKNavigationActionPolicy))decisionHandler
{
#pragma mark - 每次点击按钮会触动这个方法
    NSString *urlString = [[navigationAction.request URL] absoluteString];
    urlString = [urlString stringByRemovingPercentEncoding];
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if ([urlComps count])
    {
        // 获取协议头
        NSString *protocolHead = [urlComps objectAtIndex:0];
        NSLog(@"protocolHead=%@",protocolHead);
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
// WKNavigationDelegate 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [_progressLayer finishedLoad];
}

// WKNavigationDelegate 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    [_progressLayer finishedLoad];
}
// 让浏览器加载指定的字符串,使用m.baidu.com进行搜索
- (void)loadString:(NSString *)str
{
    
    NSString *sysTemStr;
    
    if (str) {
        
        [self.view addSubview:self.webMyView];
        [self.webMyView loadRequest:[NSURLRequest requestWithURL:
                                     [NSURL URLWithString:str]]];

        
        
    }else if (sysTemStr){
        
        
        //  通过自带浏览器 打开
        
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
        
        
        
        
    }else{
        
        
        //    NSString * url = [NSString stringWithFormat:@"%@/Users/%@%@",BaseUrl,AppName,ONLINEHELP];
        
        NSString * url = @"https://www.baidu.com";
        
        NSLog(@"链接  %@",url);
        [self.view addSubview:self.webMyView];
        [self.webMyView loadRequest:[NSURLRequest requestWithURL:
                                     [NSURL URLWithString:url]]];
        
        
      
    }
    

}
- (void)dealloc
{
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
