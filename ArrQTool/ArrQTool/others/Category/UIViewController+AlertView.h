//
//  UIViewController+AlertView.h
//  SugeiOS
//
//  Created by 素格 on 2017/5/18.
//  Copyright © 2017年 素格. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertBlock)(UIAlertAction *  action);

@interface UIViewController (AlertView)

// 快速创建一个 弹框   确定 操作弹框
-(void)creatAlertViewWithTitle:(NSString *)title message:(NSString *)message sureBlock:(AlertBlock)sureBlock;


// 快速创建一个 弹框
-(void)creatAlertViewWithTitle:(NSString *)title message:(NSString *)message CancleBlock:(AlertBlock)cancleBlock sureBlock:(AlertBlock)sureBlock ;


@end
