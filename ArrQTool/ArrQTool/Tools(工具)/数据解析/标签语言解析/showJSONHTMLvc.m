//
//  showJSONHTMLvc.m
//  ArrQTool
//
//  Created by ArrQ on 2018/3/5.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showJSONHTMLvc.h"

#import "XMLReader.h"


@interface showJSONHTMLvc ()

@end

@implementation showJSONHTMLvc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    
    
    
    
    
    
}

- (void)getData{
    
    //    NSString *xmlFileString = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"xml"];
    //    NSString *xmlFileString = [[NSBundle mainBundle] pathForResource:@"cao" ofType:@"xml"];
    //    NSString *xmlFileString = [[NSBundle mainBundle] pathForResource:@"cao" ofType:@"html"];
    
    
    NSString *documentsPath = NSHomeDirectory();
    
    
    NSString *newFielPath = [documentsPath stringByAppendingPathComponent:@"aa.html"];
    
    NSString *xmlFileString = [[NSBundle mainBundle] pathForResource:@"aa" ofType:@"html"];
    
    
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFileString];
    NSError *error = nil;
    if (error) {
        
        NSLog(@"error : %@", error);
    }
    
    NSDictionary *result = [XMLReader dictionaryForXMLData:xmlData error:&error];
    
    
    NSLog(@"result : %@", result);
    
    
    
    NSData *dictData = [NSJSONSerialization dataWithJSONObject:result options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc]initWithData:dictData encoding:NSUTF8StringEncoding];
    
    NSLog(@"result : %@", jsonString);
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
