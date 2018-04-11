//
//  LoginView.h
//  ChatDemo
//
//  Created by ArrQ on 2018/2/5.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CommonFieldTextView.h"
#import "CommonYanZhengMaFieldTextView.h"


@interface LoginView : UIView


@property(nonatomic,strong) CommonFieldTextView *Common_phone;
@property(nonatomic,strong) CommonFieldTextView *CommonPsw_001;

@property(nonatomic,copy) void(^blockLogin)(NSString *index);

@property(nonatomic,copy) void(^blockVertifyCode)(NSString *index);// 验证码



@end
