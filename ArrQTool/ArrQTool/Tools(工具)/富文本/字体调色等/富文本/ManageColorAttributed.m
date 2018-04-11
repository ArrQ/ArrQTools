//
//  ManageColorAttributed.m
//  lottery86
//
//  Created by ArrQ on 2017/12/9.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import "ManageColorAttributed.h"

@implementation ManageColorAttributed

+(NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr colorTwo:(UIColor *)colorTwo andSubTwoString:(NSArray *)subTwoStringArr{
    
    //把字符串  转位 富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:str];
    
    for (NSString *string in subStringArr) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    
    for (NSString *string in subTwoStringArr) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:colorTwo range:range];
        }
    }
    
    
    
    
    
    
    
    
    return attributedString;
    
}



+(NSMutableAttributedString *)getThreeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr colorTwo:(UIColor *)colorTwo andSubTwoString:(NSArray *)subTwoStringArr andthreeString:(NSArray *)threeString colorThree:(UIColor *)colorThree{
    
    //把字符串  转位 富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:str];
    
    for (NSString *string in subStringArr) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    
    for (NSString *string in subTwoStringArr) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:colorTwo range:range];
        }
    }
    
    
    
    
    for (NSString *string in threeString) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:colorThree range:range];
        }
    }
    
    
    
    
    return attributedString;
    
}






+(NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr{
    
    //把字符串  转位 富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:str];
    
    for (NSString *string in subStringArr) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    return attributedString;
    
}


#pragma mark - 获取某个子字符串在某个总字符串中位置数组
/**
 *  获取某个字符串中子字符串的位置数组
 *
 *  @param totalString 总的字符串
 *  @param subString   子字符串
 *
 *  @return 位置数组
 */
+ (NSMutableArray *)getRangeWithTotalString:(NSString *)totalString SubString:(NSString *)subString {
    
    NSMutableArray *arrayRanges = [[NSMutableArray alloc] initWithCapacity:0];
    
    if (subString == nil && [subString isEqualToString:@""]) {
        return nil;
    }
    
    NSRange rang = [totalString rangeOfString:subString];
    
    if (rang.location != NSNotFound && rang.length != 0) {
        
        [arrayRanges addObject:[NSNumber valueWithRange:rang]];
        
        NSRange      rang1 = {0,0};
        NSInteger location = 0;
        NSInteger   length = 0;
        
        for (int i = 0;; i++) {
            
            if (0 == i) {
                
                location = rang.location + rang.length;
                length = totalString.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            } else {
                
                location = rang1.location + rang1.length;
                length = totalString.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            
            rang1 = [totalString rangeOfString:subString options:NSCaseInsensitiveSearch range:rang1];
            
            if (rang1.location == NSNotFound && rang1.length == 0) {
                
                break;
            } else {
                
                [arrayRanges addObject:[NSNumber valueWithRange:rang1]];
            }
        }
        
        return arrayRanges;
    }
    
    return nil;
}


/**
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    
    for (NSString *string in subArray) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:totalString SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            //改变颜色
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
            //改变字体
            [attributedStr addAttribute:NSFontAttributeName value:font range:range];
        }
    }
    return attributedStr;
}

#pragma mark - 改变富文本中某个字符串字体的大小和颜色
+ (NSMutableAttributedString *)changeFont:(UIFont *)font Color:(UIColor *)color  WithAttributedString:(NSMutableAttributedString *)attributString WithOriginString:(NSString *)originString SubString:(NSString *)subString {
    //获取某个子字符串在某个总字符串中位置数组
    
    NSRange range = [originString rangeOfString:subString];
    //改变颜色
    [attributString addAttribute:NSForegroundColorAttributeName value:color range:range];
    //改变字体
    [attributString addAttribute:NSFontAttributeName value:font range:range];
    return attributString;
}
#pragma mark-----为某些文字下面画线  (中画线 / 下画线)
/**
 *  为某些文字下面画线
 *
 *  @param totalString 总的字符串
 *  @param subArray    需要改变颜色的文字数组(要是有相同的 只取第一个)
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)addLinkWithTotalString:(NSString *)totalString andLineColor:(UIColor *)lineColor SubStringArray:(NSArray *)subArray {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    
    for (NSString *string in subArray) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:totalString SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            //文字下面画线
            //画线的样式
            //线条颜色
            //被画线的字体颜色
            // NSStrikethroughStyleAttributeName  中画线
            // NSUnderlineStyleAttributeName   下划线
            [attributedStr addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:lineColor,NSForegroundColorAttributeName:lineColor}  range:range];
        }
    }
    
    return attributedStr;
}

@end
