//
//  NSString+Category.h
//  SugeiOS
//
//  Created by suge on 2016/12/5.
//  Copyright © 2016年 素格. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

//获取当前设备中应用的版本号
+ (NSString *)getCurrentAPPVersion;

/**获取设备型号*/
+ (NSString*)deviceVersion;

//计算字符串空间大小
- (CGRect)rectWithStringBoundingSize:(CGSize )stringSize withStringFont:(UIFont *)font;

//MD5加密
-(NSString *)md5;
//获取令牌
+ (NSString *)getLingPaiWithTimeInterval:(NSString *)timeInterval;

/**把字典转换成JSON格式字符串*/
+ (NSString *)DicToJsonStringWithDic:(NSDictionary *)dic ;

/**正则匹配手机号码*/
- (BOOL)checkTelNumber;
/**
 *  检查 密码是否是 6-20 数字密码
 */
- (BOOL)checkPassWord;
/**正则匹配用户身份证号 15 或 18 位*/
- (BOOL)checkUserIdCard;
/**匹配邮箱格式*/

+(BOOL)checkIsEmail:(NSString *)email;

// 非空判断
+(BOOL)isNULL:(id)string;






/**
 *把时间字符串转化为刚刚、3分钟前、几小时前。。（后台返回的时间格式 2017-10-07 11:30:10）
 */
- (NSString *)changeTimeToSecMinHoursDay;

/**自适应label高度并调整行间距*/
- (NSMutableAttributedString *)gaoSizeToFitWithRowInterval:(CGFloat)interval;



/**** 补充 时间转换 等 *****/

//时间戳字符串转化为时间
-(NSString *)timeStampToTimeString;

//获取时间搓
+(NSString *)getTimeStr:(NSString *)time withFormate:(NSString *)timeFormate;
// 获取时间
+ (NSString *)getTime:(NSString *)getTimeStr withFormate:(NSString *)timeFormate;


// 获取 当前 时间  
+(NSString*)getCurrentTimesWithFormate:(NSString *)timeFormate;
//获取当前时间戳
+ (NSString *)getCurrentTimeStr;

//把指定时间转化为时间戳
+ (NSString *)getTimeIntervalWithDate:(NSDate *)date;
//获取两个时间搓===差的值
+ (NSTimeInterval )getTimeStrCha:(NSString *)beginTimestamp andstr:(NSString *)endTimestamp;


// http请求 中文符号转换为%格式
+ (NSString *)getBase64UrlWithString:(NSString *)decodeString;

//  http请求 url 中文格式化
+ (NSString *)getStrUTF8Encoding:(NSString *)str;


// 获取 json 字典
+ (NSDictionary *)getDicWithJsonString:(NSString *)jsonString;
// 获取  json 字符串
+ (NSString *)getJsonStringWithDictionary:(NSDictionary *)dic;

// json 文件 保存与解析 可以 单独 写一个 类
+ (void)saveJsonData:(NSDictionary *)responseBody AndFileName:(NSString *)name;
+ (NSDictionary *)getDataAndFileName:(NSString *)name;






@end
