//
//  YYCustomSearchView.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/17.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYCustomSearchView : UIView

@property(nonatomic,strong) UIImageView *leftImgView;// 搜索图标
@property(nonatomic,strong) UITextField *leftTextField;// 搜索内容

@property(nonatomic,strong) UIButton *rightYuyinBtn;// 是否语音图标

@property(nonatomic,strong) UIButton *rightCancelBtn;// 取消 按钮

@end
