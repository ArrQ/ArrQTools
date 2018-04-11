//
//  ColorWithOther.h
//  LoadingView
//
//  Created by ArrQ on 2018/1/30.
//  Copyright © 2018年 李文强. All rights reserved.
//

#ifndef ColorWithOther_h
#define ColorWithOther_h

//  navi ------
#define naviBackImg [UIImage imageNamed:@"navi_back_arrow"]
//  tabbar ------
#define kNorFontTab  [UIColor colorFromHexRGB:@"333333"]
//#define kSelFontTab  [UIColor colorFromHexRGB:@"f23030"]


//   其他


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0] //16进制颜色转换

#define kRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]


#define kAPPColor [UIColor colorWithRed:(219)/255.0 green:(11)/255.0 blue:(33)/255.0 alpha:1.0]




// 统计分析 cell  字体 颜色


//#define kCellBuleColor [UIColor colorWithRed:(219)/255.0 green:(11)/255.0 blue:(33)/255.0 alpha:1.0]
//
//#define kCellGreenColor [UIColor colorWithRed:(219)/255.0 green:(11)/255.0 blue:(33)/255.0 alpha:1.0]
//#define kCellBlackColor [UIColor colorWithRed:(219)/255.0 green:(11)/255.0 blue:(33)/255.0 alpha:1.0]
//
//#define kCellZhongSeColor [UIColor colorWithRed:(219)/255.0 green:(11)/255.0 blue:(33)/255.0 alpha:1.0]
//
//#define kCellZiSeColor [UIColor colorWithRed:(219)/255.0 green:(11)/255.0 blue:(33)/255.0 alpha:1.0]



// *********  投注参考 cell  字体 color *************
#define kCanKao_cellOrangeColor [UIColor colorFromHexRGB:@"fbf400"]
#define kCanKao_cellRedColor [UIColor colorFromHexRGB:@"cd0000"]
#define kCanKao_cellBlackColor [UIColor colorFromHexRGB:@"202020"]
#define kCanKao_cellBuleColor [UIColor colorFromHexRGB:@"195fc7"]

#define kFontB(kSize) [UIFont fontWithName:@"Helvetica-Bold" size:(kSize)];

#define Frank_FONT(_font_) [UIFont systemFontOfSize:_font_]

#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define userDefault [NSUserDefaults standardUserDefaults]


// *********  历史开奖 cell  字体 color *************
#define kCellBuleColor [UIColor colorFromHexRGB:@"246DDD"]

#define kCellGreenColor [UIColor colorFromHexRGB:@"00A6AC"]
#define kCellBlackColor [UIColor colorFromHexRGB:@"333333"]
#define kCellWhiteColor [UIColor whiteColor]
#define kCellZhongSeColor [UIColor colorFromHexRGB:@"CE9527"]

#define kCellZiSeColor [UIColor colorFromHexRGB:@"9325BB"]


// *********  历史开奖 cell 字体间距 *************
#define kcell_font_1_magin @" "
#define kcell_font_2_magin @"  "
#define kcell_font_3_magin @"   "

#define kcell_font_7_magin @"       "

// *********  星星cell  字体与 collectionview 间距 *************
#define XXMagin_50 50
// xingxing 背景色


#define xingxingbullBg kRGBColor(241, 183, 66)
#define xingxingcellBg kRGBColor(252, 243, 238)
#define xingxingBtnBg kRGBColor(232, 129, 86)


// 默认 tabbarIndex

#define kTabBarIndex 3

#endif /* ColorWithOther_h */
