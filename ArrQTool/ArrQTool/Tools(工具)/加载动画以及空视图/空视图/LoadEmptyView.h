//
//  LoadEmptyView.h
//  CaiPiaoGG
//
//  Created by ArrQ on 2018/5/10.
//  Copyright © 2018年 liyatao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadEmptyView : UIView

@property(nonatomic,copy) void(^blockClcikView)(NSString *index);

@end
