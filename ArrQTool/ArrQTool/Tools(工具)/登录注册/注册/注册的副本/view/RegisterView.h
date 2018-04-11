//
//  RegisterView.h
//  ChatDemo
//
//  Created by ArrQ on 2018/3/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

@property(nonatomic,copy) void(^blockLogin)(NSString *index);// 跳转 登录 页面


@property(nonatomic,copy) void(^blockVertifyCode)(NSString *index);// 验证码


@end
