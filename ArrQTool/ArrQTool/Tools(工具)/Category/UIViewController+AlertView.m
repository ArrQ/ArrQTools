//
//  UIViewController+AlertView.m
//  SugeiOS
//
//  Created by 素格 on 2017/5/18.
//  Copyright © 2017年 素格. All rights reserved.
//

#import "UIViewController+AlertView.h"

@implementation UIViewController (AlertView)

/**
  *  快速弹框提示
  */

-(void)creatAlertViewWithTitle:(NSString *)title message:(NSString *)message sureBlock:(AlertBlock)sureBlock{

    UIAlertController * alert = [ UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancleBtn = [ UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:sureBlock];
    
    [alert  addAction:cancleBtn];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
/**
*  快速弹框提示   带block 回调
*/
-(void)creatAlertViewWithTitle:(NSString *)title message:(NSString *)message CancleBlock:(AlertBlock)cancleBlock sureBlock:(AlertBlock)sureBlock{

    UIAlertController * alert = [ UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancleBtn = [ UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:cancleBlock];
    
    UIAlertAction * sureBtn = [ UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:sureBlock];
    
    [alert  addAction:cancleBtn];
    [alert  addAction:sureBtn];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
