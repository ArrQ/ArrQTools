//
//  PTHistogramView.h
//  PTHistogramView
//
//  Created by 天蓝 on 2017/8/8.
//  Copyright © 2017年 PT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTHistogramView : UIView

/**
 柱状图
 
 @param frame frame
 @param nameArray 底部分类名称
 @param countArray 分类的数量
 */
- (instancetype)initWithFrame:(CGRect)frame
                    nameArray:(NSArray <NSString *>*)nameArray
                   countArray:(NSArray <NSString *>*)countArray;
- (void)draw;
@end
