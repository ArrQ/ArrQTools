//
//  showHtmlTitleMore.m
//  YiRen
//
//  Created by ArrQ on 2018/3/5.
//  Copyright © 2018年 李文强. All rights reserved.
//

#import "showHtmlTitleMore.h"
#import "TFHpple.h"

@interface showHtmlTitleMore ()

@end

@implementation showHtmlTitleMore

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = @"http://www.jianshu.com/u/e163bc6048d8";
    
    //将网址转化为data数据
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    
    //创建解析对象
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *dataArr = [xpathParser searchWithXPathQuery:@"//a"];
    
    for (TFHppleElement *element in dataArr) {
        
        if ([[element objectForKey:@"class"] isEqualToString:@"title"]) {
            NSLog(@"%@\n",element.text);
            
        }
    }
    
    
    [self getDATA];
    
    
}


- (void)getDATA{
    
    //    　NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.lomowo.com/posts/47632"] encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *dataString = [NSString stringWithContentsOfFile:[[NSBundle 　　　　　　mainBundle]pathForResource:@"nimei" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    
    //        NSRange rang1=[dataString rangeOfString:@"<div class=\"content\">"];
    //
    //    　　 NSMutableString *imageStr2=[[NSMutableString alloc]initWithString:[dataString substringFromIndex:rang1.location+rang1.length]];
    //
    //
    //
    //    　　NSRange rang2=[imageStr2 rangeOfString:@"<div class=\"clear\">"];
    //
    //    　　NSMutableString *imageStr3=[[NSMutableString alloc]initWithString:[imageStr2 substringToIndex:rang2.location]];
    //
    //
    //
    //    　　NSLog(@"%@",imageStr3);
    
    
    
    dataString = [dataString componentsSeparatedByString:@"<form"][1];
    
    dataString = [dataString componentsSeparatedByString:@"</form>"][0];
    
    NSData *data=[dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    TFHpple *xpathParser = [[TFHpple alloc]initWithHTMLData:data];
    
    // 根据标签进行筛选 获取所有标签是<p>的代码块
    //    NSArray *elements  = [xpathParser searchWithXPathQuery:@"//span"];
    
    NSArray *elements  = [xpathParser searchWithXPathQuery:@"//td"];
    
    NSMutableArray *contArray = [[NSMutableArray alloc]init];
    
    
    NSMutableArray *titlearray = [NSMutableArray array];
    
    //开始整理数据
    for (TFHppleElement *elsement in elements) {
        if ([elsement content] != nil) {
            
            //          NSDictionary *elementContent =[elsement attributes];
            
            //           NSString *str = [NSString stringWithFormat:@"%@",[elementContent objectForKey:@"span"]];
            
            NSString *str = [NSString stringWithFormat:@"%@",elsement.text];
            [titlearray addObject:str];
            
            //            if ([[elsement objectForKey:@"class"]isEqualToString:@"span_tit"]) {//筛选属性是里有style 并且值是text-align的标签
            //
            //
            //
            //                NSString *str = [NSString stringWithFormat:@"%@",elsement.raw];
            //
            //                [titlearray addObject:elsement.text];
            //
            //
            //
            //            }
        }
    }
    
    NSLog(@"=====%@",titlearray);
    
    //开始整理数据
    //    for (TFHppleElement *elsement in elements) {
    //        if ([elsement content] != nil) {
    //
    //            //将这段代码转换成字典  key是标签内的属性  value是属性对应的值
    //            //得到的是标签属性  不能得到标签内容
    //            NSDictionary *elementContent =[elsement attributes];
    //            NSLog(@"-----------%@",elementContent);
    //
    //            if (elementContent != nil) {
    //
    //                [contArray addObject:[elementContent objectForKey:@"class"]];
    //
    //
    //
    //
    //            }
    //
    //        }
    //    }
    
    
    NSLog(@"====== %@",contArray);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
