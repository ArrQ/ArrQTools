//
//  showNetWorkViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/28.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showNetWorkViewController.h"

@interface showNetWorkViewController ()

@end

@implementation showNetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)getRequestData{
    
    NSString *main = @"MainUrl";
    
    NSString *url = [NSString stringWithFormat:@"%@ThirdPartyPaymentDepositRequest/ThirdPartyPaymentAndBankDepositCreate",main];
    
    NSString *nextUrl = [NSString stringWithFormat:@"%@Home/Home",main];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //调出请求头
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.HTTPShouldHandleCookies = YES;
    [manager.requestSerializer setValue:nextUrl forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1" forHTTPHeaderField:@"User-Agent"];

    AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    [security setValidatesDomainName:NO];
    
    security.allowInvalidCertificates = YES;
    
    manager.securityPolicy = security;
    manager.requestSerializer.timeoutInterval = 30;
    
    
    
    
    //   302 重定向 重新请求 接口
    [manager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest * _Nonnull(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSURLResponse * _Nonnull response, NSURLRequest * _Nonnull request) {
        
        NSString *strUrl = [NSString stringWithFormat:@"%@",request.URL];
        
        NSLog(@"===== %@",request);
        
        if (request)
        {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                [self getOnceIs:strUrl];
                
            });
            
            
            return request;
        }
        
        return nil;
    }];
    
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error == %@",error);
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         
            
            
        });
        
        
        
        
    }];
    
    
}






@end
