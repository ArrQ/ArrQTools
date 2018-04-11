//
//  showTangkuangVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/3.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showTangkuangVC.h"

@interface showTangkuangVC ()

@end

@implementation showTangkuangVC

- (void)viewDidLoad {
    [super viewDidLoad];

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        ViewController *VC = [[ViewController alloc] init];
//        [UIApplication sharedApplication].delegate.window.rootViewController = VC;
//    });
//
//
    
//
//    SheZhiPhoneNumVC *shezhiVC = [[SheZhiPhoneNumVC alloc]init];
//
//
//
//
//    UINavigationController *naivc = [[UINavigationController alloc]initWithRootViewController:shezhiVC];
//
//    UIWindow * win = [UIApplication sharedApplication].keyWindow;
//
//    [win.rootViewController presentViewController:naivc animated:YES completion:nil];
//
//
//

}

- (void)getOne{
    
     //显示提示框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              //响应事件
                                                              NSLog(@"action = %@", action);
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];

    [self presentViewController:alert animated:YES completion:nil];
    
    
}


- (void)getTwo{
    
    //提示框添加文本输入框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         //响应事件
                                                         //得到文本信息
                                                         for(UITextField *text in alert.textFields){
                                                             NSLog(@"text = %@", text.text);
                                                         }
                                                     }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", alert.textFields);
                                                         }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"登录";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)getThree{
    
    //显示弹出框列表选择
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an Sheet."
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           //响应事件
                                                           NSLog(@"action = %@", action);
                                                       }];
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addAction:deleteAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
