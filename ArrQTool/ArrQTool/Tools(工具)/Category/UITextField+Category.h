//
//  UITextField+Category.h
//  SugeiOS
//
//  Created by suge on 2017/6/5.
//  Copyright © 2017年 素格. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)
/**创建一个带左边view的textFeild*/
+ (UITextField *)createTextFieldWithLeftViewWidth:(CGFloat )width;

+ (UITextField *)createTextFieldWithLeftImageViewSize:(CGFloat)size andImageName:(NSString *)name andTFHeight:(CGFloat)height;

@end
