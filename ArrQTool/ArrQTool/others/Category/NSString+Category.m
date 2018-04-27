//
//  NSString+Category.m
//  SugeiOS
//
//  Created by suge on 2016/12/5.
//  Copyright © 2016年 素格. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"
@implementation NSString (Category)

//获取当前设备中应用的版本号

+ (NSString *)getCurrentAPPVersion{
    
    NSDictionary *dicOne = [[NSBundle mainBundle] infoDictionary];
    
    NSString *currentVersion = [dicOne objectForKey:@"CFBundleShortVersionString"];

    return currentVersion;
    
}

//计算字符串空间
- (CGRect)rectWithStringBoundingSize:(CGSize )stringSize withStringFont:(UIFont *)font{
    CGRect rect = [self boundingRectWithSize:stringSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect;
}
//时间戳字符串转化为时间
-(NSString *)timeStampToTimeString
{
    NSTimeInterval interval=[self doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *str =[objDateformat stringFromDate:date];
    return str;
}
//MD5加密
-(NSString *)md5
{
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}



//获取令牌
+ (NSString *)getLingPaiWithTimeInterval:(NSString *)timeInterval{
    NSString *lingPaiToken = [[NSString stringWithFormat:@"%@%@",timeInterval,@"wo!SH>.iCh@a#?oJ**iAPP("] md5];
    
//    NSLog(@"-----%@",lingPaiToken);
    
    return lingPaiToken;
}
//获取时间戳
+ (NSString *)getCurrentTimeStr{
    
    NSDate *date = [NSDate date];
    
    NSString *timeInterval = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]*1000];
//    NSLog(@"-----%@",timeInterval);
    return timeInterval;
}

/**把字典转换成JSON格式字符串*/
+ (NSString *)DicToJsonStringWithDic:(NSDictionary *)dic{
    NSData *dicData =[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *dicDataJsonString =[[NSString alloc]initWithData:dicData encoding:NSUTF8StringEncoding];
    return dicDataJsonString;
}

/**正则匹配手机号码*/
- (BOOL)checkTelNumber
{
    NSString *pattern = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**检查 密码是否是 6-20 数字密码*/
- (BOOL)checkPassWord
{
    NSString *pattern = @"^[0-9A-Za-z]{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**正则匹配用户身份证号 15 或 18 位*/
- (BOOL)checkUserIdCard{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


/**匹配邮箱格式*/

+ (BOOL)checkIsEmail:(NSString *)email{
    
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}




//  判断字符串是否为空
+(BOOL)isNULL:(id)string{
    
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


//把指定时间转化为时间戳
+ (NSString *)getTimeIntervalWithDate:(NSDate *)date{
    NSString *timeInterval = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]*1000];
    //    NSLog(@"-----%@",timeInterval);
    return timeInterval;
}
//获取设备型号
+ (NSString*)deviceVersion{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod Touch 6G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad Mini 4G";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad Mini 4G";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad Pro";
    //return @"iPad Pro (9.7 inch)"
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad Pro";
    //return @"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad Pro";
    //return @"iPad Pro (12.9 inch)";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad Pro";
    //return @"iPad Pro (12.9 inch)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

/**
 *把时间字符串转化为刚刚、3分钟前、几小时前。。
 */
- (NSString *)changeTimeToSecMinHoursDay{
    NSString *dateStr = @"";
    //创建时间格式器，并设置时间格式
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    NSString *formaterStr = @"yyyy-MM-dd HH:mm:ss";
    //     NSString *formaterStr = @"yyyy-MM-dd HH:mm:ss EEEE";
    //yyyy-MM-dd HH:mm:ss EEEE
    formater.dateFormat = formaterStr;
    
    //用时间格式器把指定的时间字符串 转化为相应格式的时间
    NSDate *houTaiDate = [formater dateFromString:self];
    
    //日历
    //    NSCalendar *calendar = [NSCalendar currentCalendar];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
    {
        NSDate *currentDate = [NSDate date];
        //判断后台返回时间和当前时间的时间差,单位是秒
        double tempTimeInterval = [currentDate timeIntervalSinceDate:houTaiDate];
        if (tempTimeInterval <= 86400){
            if(tempTimeInterval < 60){
                dateStr = @"刚刚";
            }else if ((tempTimeInterval/60.0 > 1) && (tempTimeInterval / 60.0 / 60.0 < 1)){
                dateStr = [NSString stringWithFormat:@"%d分钟前",(int)tempTimeInterval/60];
            }else{
                dateStr = [NSString stringWithFormat:@"%d小时前",(int)tempTimeInterval/60/60];
            }
            
        }else{
            //返回 年月日发布的
            formater.dateFormat = @"yyyy-MM-dd";
            
            dateStr = [formater stringFromDate:houTaiDate];
        }
        
    }else{
        //日历
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        //根据日历判断 后台返回时间是否是在今天
        if ([calendar isDateInToday:houTaiDate]){
            //返回今天什么时候发布的，比如3分钟前
            
            NSDate *currentDate = [NSDate date];
            
            //判断后台返回时间和当前时间的时间差,单位是秒
            double tempTimeInterval = [currentDate timeIntervalSinceDate:houTaiDate];
            //        tempTimeInterval -= 8 * 3600;
            
            if(tempTimeInterval < 60){
                dateStr = @"刚刚";
            }else if ((tempTimeInterval/60.0 > 1) && (tempTimeInterval / 60.0 / 60.0 < 1)){
                dateStr = [NSString stringWithFormat:@"%d分钟前",(int)tempTimeInterval/60];
            }else{
                dateStr = [NSString stringWithFormat:@"%d小时前",(int)tempTimeInterval/60/60];
            }
            
        }else{
            //返回 年月日发布的
            formater.dateFormat = @"yyyy-MM-dd";
            
            dateStr = [formater stringFromDate:houTaiDate];
        }
    }
    
    return dateStr;
}
//调整label行间距并且高度自适应
- (NSMutableAttributedString *)gaoSizeToFitWithRowInterval:(CGFloat)interval{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:interval];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}


# pragma mark --- about time ----

//获取时间搓
+(NSString *)getTimeStr:(NSString *)time withFormate:(NSString *)timeFormate
{
    NSDateFormatter * dateFormater = [NSDateFormatter new];
    //    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormater setDateFormat:timeFormate];
    
    NSDate * date = [dateFormater dateFromString:time];
    NSString * timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}


// 获取时间
+ (NSString *)getTime:(NSString *)getTimeStr withFormate:(NSString *)timeFormate
{
    NSDateFormatter * dateFormater = [NSDateFormatter new];
    //    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormater setDateFormat:timeFormate];
    NSDate * confirmDate = [NSDate dateWithTimeIntervalSince1970:[getTimeStr integerValue]];
    NSString * myString = [dateFormater stringFromDate:confirmDate];
    
    return myString;
}



//获取当前的时间

+(NSString*)getCurrentTimesWithFormate:(NSString *)timeFormate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:timeFormate];//@"YYYY-MM-dd HH:mm:ss"
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
//    NSLog(@"currentTimeString =  %@",currentTimeString);
    
    return currentTimeString;
    
}


// pragma mark --- 时间戳的差
+ (NSTimeInterval )getTimeStrCha:(NSString *)beginTimestamp andstr:(NSString *)endTimestamp{
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[beginTimestamp doubleValue]];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[endTimestamp doubleValue]];
    
    NSTimeInterval seconds = [date2 timeIntervalSinceDate:date];
    
    return seconds;
    
}





# pragma mark - url 中文格式化
+ (NSString *)getBase64UrlWithString:(NSString *)decodeString{
    
    NSString *base64String;
    /*! ios9适配的话 打开第一个 */
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0)
    {
        
        
        NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
        
        NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
        
        base64String = [decodeString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
        
        
    }else{
        base64String = [decodeString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    
    
    
    return base64String;
    
    
}


#pragma mark - url 中文格式化
+ (NSString *)getStrUTF8Encoding:(NSString *)str
{
    /*! ios9适配的话 打开第一个 */
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0)
    {
        return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    }else{
        return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}



# pragma mark --- json 字典 02 --
+ (NSDictionary *)getDicWithJsonString:(NSString *)jsonString{
    
    NSDictionary *retDict = nil;
    if ([jsonString isKindOfClass:[NSString class]]) {
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        retDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        return  retDict;
    }else{
        return retDict;
    }
    
}


# pragma mark --- json 字符串 ---
+ (NSString *)getJsonStringWithDictionary:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


//存储Json
+ (void)saveJsonData:(NSDictionary *)responseBody AndFileName:(NSString *)name
{
    NSLog(@"得到的数据 📚 %@",responseBody);
    if (responseBody == nil) {
        return;
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:responseBody options:NSJSONWritingPrettyPrinted error:nil];
    //    将Json存进本地文件夹
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [paths objectAtIndex:0];
    NSString * Json_path = [path stringByAppendingPathComponent:name];
    //==写入文件
    NSLog(@"%@",[data writeToFile:Json_path atomically:YES] ? @"Succeed":@"Failed");
    
}
+ (NSDictionary *)getDataAndFileName:(NSString *)name
{
    //    读取Json
    //==Json文件路径
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *Json_path=[path stringByAppendingPathComponent:name];
    //==Json数据
    NSData *data=[NSData dataWithContentsOfFile:Json_path];
    //==JsonObject、
    if (data == nil)
    {
        return nil;
    }else
    {
        NSDictionary * JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                                  options:NSJSONReadingAllowFragments
                                                                    error:nil];
        
        return JsonObject;
    }
    
    
}




@end
