//
//  UITextField+Category.m
//  SugeiOS
//
//  Created by suge on 2017/6/5.
//  Copyright © 2017年 素格. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)
+ (UITextField *)createTextFieldWithLeftViewWidth:(CGFloat )width{
    UITextField *textField = [[UITextField alloc] init];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}
+ (UITextField *)createTextFieldWithLeftImageViewSize:(CGFloat)size andImageName:(NSString *)name andTFHeight:(CGFloat)height{
    UITextField *textField = [[UITextField alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (height - size)/2.0, 30, 30)];
    textField.leftView = imageView;
    imageView.image = [UIImage imageNamed:name];
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
    
}

@end
