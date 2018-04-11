//
//  ManageColorAttributed.h
//  lottery86
//
//  Created by ArrQ on 2017/12/9.
//  Copyright © 2017年 付宝网络. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ManageColorAttributed : NSObject

+(NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr colorTwo:(UIColor *)colorTwo andSubTwoString:(NSArray *)subTwoStringArr;


+(NSMutableAttributedString *)getThreeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr colorTwo:(UIColor *)colorTwo andSubTwoString:(NSArray *)subTwoStringArr andthreeString:(NSArray *)threeString colorThree:(UIColor *)colorThree;









#pragma mark - 单纯改变一句话中的某些字的颜色（一种颜色）
/**
 *  单纯改变一句话中的某些字的颜色（一种颜色）
 *
 *  @param color    需要改变成的颜色
 *  @param str 总的字符串
 *  @param subStringArr 需要改变颜色的文字数组(字符串中所有的 相同的字)
 *
 *  @return 生成的富文本
 */
+(NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr;


#pragma mark - 获取某个子字符串在某个总字符串中位置数组
/**
 *  获取某个字符串中子字符串的位置数组 (字符串中所有的 相同的字)
 *
 *  @param totalString 总的字符串
 *  @param subString   子字符串
 *
 *  @return 位置数组
 */
+ (NSMutableArray *)getRangeWithTotalString:(NSString *)totalString SubString:(NSString *)subString;



#pragma mark - 改变某些文字的颜色 并单独设置其字体

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
+ (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;



#pragma mark - 改变富文本中某个字符串字体的大小
+ (NSMutableAttributedString *)changeFont:(UIFont *)font Color:(UIColor *)color WithAttributedString:(NSMutableAttributedString *)attributString WithOriginString:(NSString *)originString SubString:(NSString *)subString;

#pragma mark - 为某些文字下面画线   (中画线 / 下画线)
/**
 *  为某些文字下面画线
 *
 *  @param totalString 总的字符串
 *  @param subArray    需要画线的文字数组
 *  @param lineColor   线条的颜色
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)addLinkWithTotalString:(NSString *)totalString andLineColor:(UIColor *)lineColor SubStringArray:(NSArray *)subArray;


@end
