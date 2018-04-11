//
//  showArrayVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/2.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showArrayVC.h"

@interface showArrayVC ()

@end

@implementation showArrayVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self getPaiXuDefaultIndexFromArray];
    
    [self getIsContainStrOne];
   
    NSMutableArray *temp = [NSMutableArray arrayWithObjects:@"5",@"1",@"4",@"2",nil];
    
//   直接  倒序 排列 2，4，1，5
    temp = (NSMutableArray *)[[temp reverseObjectEnumerator] allObjects];
    
    NSArray *arr = @[@"5",@"1",@"4",@"2"];
    
     arr = [[arr reverseObjectEnumerator] allObjects];
    
     NSArray *arrshengxu =  [arr sortedArrayUsingSelector:@selector(compare:)];
    
    NSArray *arrdaoxu =  [[arrshengxu reverseObjectEnumerator] allObjects];;

    //通过自带的compare方法升序排列=》1，2，3，4，5
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"5",@"1",@"4",@"2",@"3",nil];
    [array sortUsingSelector:@selector(compare:)];
    
    
    //通过倒序的方法进行降序排列 =》5，4，3，2，1
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    array =[[NSMutableArray alloc]initWithArray: [enumerator allObjects]];
    

  
}

# pragma mark ---  字符串 数组 常用的算法

- (void)arrayAndStrNormal{
    
    
    
//    数组 区
    NSArray *data = @[@"1",@"2"];
    
//    **** 数组中 最值 和 等
    NSNumber *max = [data valueForKeyPath:@"@max.floatValue"];
    NSNumber *min = [data valueForKeyPath:@"@min.floatValue"];
    NSNumber *hezhi = [data valueForKeyPath:@"@sum.floatValue"];
    
//   字符串 区
    
    NSInteger yushu = [hezhi integerValue]%3;// 取余数

    
    
    
    
}










# pragma mark ---  字符串 =》 数组
- (NSArray *)getArrayWithString:(NSString *)oneStr{
    
//    这里只区别 中英文 逗号,下划线,空格 === 针对  1位 占位符 处理
    NSMutableArray *dataArray = [NSMutableArray array];
    
    if ([oneStr containsString:@","]) {
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@"," withString:@","]];
        
    }else if ([oneStr containsString:@"，"]){
        
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@"，" withString:@","]];
        
        
    }else if ([oneStr containsString:@" "]){
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@" " withString:@","]];
        
        
        
    }else if ([oneStr containsString:@"_"]){
        
        
       [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@"_" withString:@","]];
        
        
    }else{
        
        for (int i = 0; i<oneStr.length; i++) {
            
            [dataArray addObject:[oneStr substringWithRange:NSMakeRange(i, 1)]];
            
            
        }

        
        
    }
    
    return dataArray;


}

# pragma mark --- 数组 =》 字符串
- (NSString *)getStringWithArray:(NSArray *)dataArray{
    
    NSString *oneStr;
    
    oneStr = [dataArray componentsJoinedByString:@","];
    
    return oneStr;
    
    
}


# pragma mark --- 任意两位数的和的 算法

- (NSArray *)getAnyTwoWeiHeWithArray:(NSArray *)data{
    
    
    //    NSArray *data = @[@"1",@"2",@"3",@"4",];
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *arrayall = [NSMutableArray array];
    
    NSString *stralllll ;
    for (NSString *strone in data) {
        
        for (NSString *strtwo in data) {
            
            
            if (![strone isEqualToString:strtwo]) {
                
                
                NSInteger all = [strone integerValue] + [strtwo integerValue];
                stralllll = [NSString stringWithFormat:@"%ld",all];
                
                [array addObject:stralllll];
                
                
                
            }
            
            
        }
        
        
    }
    
    NSLog(@"=======%@",array);
    [arrayall addObjectsFromArray:array];
    
    return arrayall;
    
    
}



# pragma mark --- 任意两位数的差的 算法

- (NSArray *)getAnyTwoWeiChaWithArray:(NSArray *)data{
    
    
    //    NSArray *data = @[@"1",@"2",@"3",@"4",];
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *arrayall = [NSMutableArray array];
    
    NSString *stralllll ;
    for (NSString *strone in data) {
        
        for (NSString *strtwo in data) {
            
            if (![strone isEqualToString:strtwo]) {
                
                NSInteger all = [strone integerValue] - [strtwo integerValue];
                
                all = labs(all);// 取绝对值
                stralllll = [NSString stringWithFormat:@"%ld",all];
                
                [array addObject:stralllll];
                
                
                
            }
            
            
        }
        
        
    }
    
    NSLog(@"=======%@",array);
    [arrayall addObjectsFromArray:array];
    
    return arrayall;
    
    
}


#pragma mark -- 数组排序方法（升序）

- (NSArray *)paiXuArrayWithArray:(NSArray *)data{
    
    //数组排序
    
    //定义一个数字数组
    
    NSArray *array = @[@(3),@(4),@(2),@(1)];
    
    //对数组进行排序
    
    NSArray *result = [data sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        NSLog(@"%@~%@",obj1,obj2); //3~4 2~1 3~1 3~2
        
        return [obj1 compare:obj2]; //升序
        
    }];
    
    NSLog(@"result=%@",result);
    
    return result;
    
    
}



# pragma mark ---  判断 数组 是另一个的 子集
- (BOOL)getIsDaXiaoWithArray:(NSArray *)da andxiao:(NSArray *)xiao{
    
    NSSet *setda = [NSSet setWithArray:da];
    NSSet *setxiao = [NSSet setWithArray:xiao];
    
    if ([setxiao isSubsetOfSet:setda]) {
        return YES;
    }
    else {
        return NO;
    }
    
    
    
}



# pragma mark --- 提取 数组中 相同 元素

- (NSArray *)getArrayCommonFromArrayWithArray:(NSArray *)dataArray{
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSString *strone in dataArray) {
        
        if (![resultArray containsObject:strone]) {
            
            [resultArray addObject:strone];
            
        }
        
    }
    
    
    
    return resultArray;
    
}


# pragma mark --- 提取 数组中 的  元素 是否包含 另一个 数组的  元素

- (void)getIsContainStrOne{
    
    NSArray *arrA = @[@"2345", @"5678", @"7893", @"4567",@"9999"];
    NSArray *arrB = @[@"23", @"56"];
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSString *strA in arrA) {
        __block BOOL isContain = NO;
        [arrB enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BOOL isInnerContain = YES;
            NSInteger i = 0;
            while (isInnerContain&&i<obj.length) {
                isInnerContain = [strA containsString:[obj substringWithRange:NSMakeRange(i, 1)]];
                i ++;
            }
            if (isInnerContain) {
                isContain = YES;
                *stop = YES;
            }
        }];
        if (!isContain) {
            [result addObject:strA];
        }
    }
    

    NSLog(@"====== 结果值：%@",result);// 1234 里面的元素 是否同时 有 23，或则 56
    
    
}



# pragma mark ---   按照 指定位置 排序

- (void)getPaiXuDefaultIndexFromArray{
    
    
    //    按照 指定的 来排序 数组顺序 来 排序
    
    NSString *strone = @"1, 3, 4, 9, 2, 7, 5, 8, 6, 10, 11";// 指定的 id 存取
    NSArray *dataOne = [strone componentsSeparatedByString:@","];
    NSArray *dataSource = @[@{@"title":@"标题-1",@"game":@"1"},
                            @{@"title":@"标题-3",@"game":@"3"},
                            @{@"title":@"标题-5",@"game":@"5"},
                            @{@"title":@"标题-4",@"game":@"4"},
                            @{@"title":@"标题-2",@"game":@"2"},
                            @{@"title":@"标题-8",@"game":@"8"},
                            @{@"title":@"标题-6",@"game":@"6"},
                            @{@"title":@"标题-10",@"game":@"10"},
                            @{@"title":@"标题-7",@"game":@"7"},
                            @{@"title":@"标题-9",@"game":@"9"},
                            @{@"title":@"标题-11",@"game":@"11"}
                            
                            ];
    
    NSMutableArray *arrdata = [NSMutableArray array];

    for (int i = 0; i<dataOne.count; i++) {
        
        for (int j = 0; j<dataSource.count; j++) {
            
            NSDictionary *dic = dataSource[j];
            
            
            if ([dataOne[i] integerValue]  == [dic[@"game"] integerValue]) {
                
                NSMutableDictionary *dicOne = [NSMutableDictionary dictionary];
                
                [dicOne setObject:dic[@"game"] forKey:@"game"];
                [dicOne setObject:dic[@"title"] forKey:@"title"];
                
                
                [arrdata addObject:dicOne];
                
                
            }
            
            
            
        }
        
        
        
    }
    
    
    NSLog(@"======= %@",arrdata);
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}



@end
