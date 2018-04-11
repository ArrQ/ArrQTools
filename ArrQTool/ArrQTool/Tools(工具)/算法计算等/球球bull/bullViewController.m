//
//  bullViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2017/12/19.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "bullViewController.h"

@interface bullViewController ()

@end

@implementation bullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(10, 100, 100, 40);
    [button_ setTitle:@"加入" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    button_.backgroundColor = [UIColor redColor];
    
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_ addTarget:self action:@selector(getqianhouxiangtong) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];
    

    

}



# pragma mark --- 数据 前后 是否 相同
- (void)getqianhouxiangtong{
    

    NSMutableArray *dataArray = [NSMutableArray array];

    
    NSArray<NSString *> *arr1 = @[@"1", @"1", @"0", @"1", @"0", @"0", @"1", @"1", @"1"];
    NSMutableArray *arr2 = [NSMutableArray array];

    for (int i = 0 ; i <arr1.count;) {

        
        NSString *string = arr1[i];
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObject:string];

        for (int j = i + 1; j < arr1.count; j++) {
            NSString *jstring = arr1[j];
            i++;

            if ([jstring isEqualToString:string]) {
                [tempArray addObject:jstring];
            }else{

                break;
                
            }

          
        }

        
            [arr2 addObject:tempArray];
        

        if (i == arr1.count-1) {// 别忘记 加

            break;

        }

     

    }


    [dataArray addObjectsFromArray:arr2];
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//
//        NSArray<NSString *> *arr1 = @[@"1",@"1", @"1", @"0", @"1", @"0", @"0", @"1", @"1", @"1"];
//
//        NSMutableArray *dataArray = [NSMutableArray array];
//        [dataArray addObjectsFromArray:arr1];
//        NSMutableArray *arr2 = [NSMutableArray array];
//        NSMutableArray *arr3 = [NSMutableArray array];
//        NSMutableArray *arrAll = [NSMutableArray array];
//        NSMutableArray *arrAlllllll = [NSMutableArray array];
//
//        for (int i = 0 ; i <dataArray.count;) {
//
//            NSString *string = dataArray[i];
//            NSString *stringTwo = dataArray[i+1];
//            [arr3 addObject:string];
//            if ([string isEqualToString:stringTwo]) {
//
//                [arr3 addObject:dataArray[i]];
//
//                [dataArray removeObject:dataArray[i]];
//                i++;
//
//            }else{
//
//                [arrAll addObject:arr3];
//
//
//
//            }
//
//
//        }
//
//
//        NSLog(@"==========%@",arrAll);
//
//
//
//
//
//






    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //
    //    NSArray<NSString *> *arr1 = @[@"1", @"1", @"0", @"1", @"0", @"0", @"1", @"1", @"1"];
    //    NSMutableArray *arr2 = [NSMutableArray array];
    //    NSMutableArray *arr3 = [NSMutableArray array];
    //    NSMutableArray *arrAll = [NSMutableArray array];
    //    NSMutableArray *arrAlllllll = [NSMutableArray array];
    //
    //    for (int i = 0 ; i <arr1.count;) {
    //
    //        NSString *string = arr1[i];
    //        NSString *stringTwo = arr1[i+1];
    //
    //
    //        if (i<arr1.count-1) {
    //
    //
    //            if ([string isEqualToString:stringTwo]) {
    //
    //
    //                [arr2 addObject:string];
    //
    //                [arr2 addObject:stringTwo];
    //                [arrAll addObject:arr2];
    //
    //                i = i+2;
    //
    //            }else{
    //
    //                i = i;
    //
    //                [arr3 addObject:string];
    //                [arrAll addObject:arr3];
    //
    //                i = i+1;
    //
    //            }
    //
    //        }
    //
    //
    //
    //    }
    //
    //
    //    NSLog(@"==========%@",arrAll);
    //
    
    
}




# pragma mark --- 数据 中 所有的 元素  是否 有相同

- (void)getXiangtongyuansu{
    
    
    NSArray *array1 = @[@"2016-10-01",@"2016-10-02",@"2016-10-03",
                        
                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
                        
                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
                        
                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
                        
                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
                        
                        @"2016-10-01",@"2016-10-02",@"2016-10-03",
                        
                        @"2016-10-04",@"2016-10-06",@"2016-10-08",
                        
                        @"2016-10-05",@"2016-10-07",@"2016-10-09"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:array1];
    
    NSMutableArray *dateMutablearray = [@[] mutableCopy];
    for (int i = 0; i < array.count; i ++) {
        
        NSString *string = array[i];
        
        NSMutableArray *tempArray = [@[] mutableCopy];
        
        [tempArray addObject:string];
        
        for (int j = i+1; j < array.count; j ++) {
            
            NSString *jstring = array[j];
            
            if([string isEqualToString:jstring]){
                
                [tempArray addObject:jstring];
                
                [array removeObjectAtIndex:j];
                j -= 1;
                
            }
            
        }
        
        [dateMutablearray addObject:tempArray];
        
    }
    
    NSLog(@"dateMutable:%@",dateMutablearray);
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];



}


@end
