//
//  shunzibaozhiduiziVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/1/2.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "shunzibaozhiduiziVC.h"

@interface shunzibaozhiduiziVC ()<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *one;

@property(nonatomic,strong) UITextField *two;
@property(nonatomic,strong) UITextField *three;

@property(nonatomic,strong) UIButton *resultBtn;

@property(nonatomic,strong) UILabel *resultLabel;


@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) NSMutableArray * resultArray;

@end

@implementation shunzibaozhiduiziVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    
    _resultArray = [[NSMutableArray alloc] initWithCapacity:0];
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self customUI];
    
    
    
}


# pragma mark --- customUI

- (void)customUI{
    
    UITextField *field_000 = [[UITextField alloc]init];
    field_000.backgroundColor = [UIColor whiteColor];
    field_000.layer.masksToBounds = YES;
    field_000.layer.cornerRadius = 5;
    field_000.font = [UIFont systemFontOfSize:14];
    
    field_000.placeholder = @"请输入...";
    
    field_000.delegate = self;
    field_000.clearButtonMode = UITextFieldViewModeAlways;
//    field_000.secureTextEntry = YES;
    field_000.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:field_000];
    _one = field_000;
    
    
    UITextField *field_001 = [[UITextField alloc]init];
    field_001.backgroundColor = [UIColor whiteColor];
    field_001.layer.masksToBounds = YES;
    field_001.layer.cornerRadius = 5;
    field_001.font = [UIFont systemFontOfSize:14];
    
    field_001.placeholder = @"请输入...";
    
    field_001.delegate = self;
    field_001.clearButtonMode = UITextFieldViewModeAlways;
//    field_001.secureTextEntry = YES;
    field_001.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:field_001];
    _two = field_001;
    
    
    UITextField *field_002 = [[UITextField alloc]init];
    field_002.backgroundColor = [UIColor whiteColor];
    field_002.layer.masksToBounds = YES;
    field_002.layer.cornerRadius = 5;
    field_002.font = [UIFont systemFontOfSize:14];
    
    field_002.placeholder = @"请输入...";
    
    field_002.delegate = self;
    field_002.clearButtonMode = UITextFieldViewModeAlways;
//    field_002.secureTextEntry = YES;
    field_002.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:field_002];
    _three = field_002;
    
    
    UILabel *lable_000 = [[UILabel alloc]init];
    lable_000.text = @"结果值";
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentLeft;
    lable_000.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    [self.view addSubview:lable_000];
    _resultLabel = lable_000;
    
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_ setTitle:@"计算=" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    button_.backgroundColor = [UIColor greenColor];
    [button_ addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];
    
    _resultBtn = button_;
    
    
    
}


- (void)btnClick:(UIButton *)sender{
    
    
    [_dataArray removeAllObjects];
    [_resultArray removeAllObjects];
    NSNumber *number1 = [[NSNumber alloc] initWithInteger:[_one.text integerValue]];
    NSNumber *number2 = [[NSNumber alloc] initWithInteger:[_two.text integerValue]];
    NSNumber *number3 = [[NSNumber alloc] initWithInteger:[_three.text integerValue]];
    
    [_dataArray addObject:number1];
    [_dataArray addObject:number2];
    [_dataArray addObject:number3];
    
    [_dataArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2]; //升序
    }];
    
    NSLog(@"%@",_dataArray);
    
    NSString *tempStr = @"";
    for (NSInteger i = 0; i < _dataArray.count; i ++) {
        NSNumber *number = _dataArray[i];
        if (i == 0) {
            tempStr = [NSString stringWithFormat:@"%@",number];
        }else{
            tempStr = [NSString stringWithFormat:@"%@%@",tempStr,number];
        }
    }
    NSNumber *number = [_dataArray lastObject];
    if ([number integerValue] > 9) {
        NSLog(@"****%@",tempStr);
        if ([tempStr isEqualToString:@"11011"] || [tempStr isEqualToString:@"1211"]) {
            self.resultLabel.text = @"顺子";
            return;
        }else if (![tempStr isEqualToString:@"1111"] && ![tempStr isEqualToString:@"11111"]){
            tempStr = [NSString stringWithFormat:@"%@%@",_dataArray[0],_dataArray[2]];
            if ([tempStr isEqualToString:@"111"]){
                self.resultLabel.text = @"半顺";
                return;
            }
        }
        
    }else{
        NSLog(@"****%@",tempStr);
        if ([tempStr isEqualToString:@"019"] || [tempStr isEqualToString:@"089"]) {
            self.resultLabel.text = @"顺子";
            return;
        }else if (![tempStr isEqualToString:@"099"] && ![tempStr isEqualToString:@"009"]){
            tempStr = [NSString stringWithFormat:@"%@%@",_dataArray[0],_dataArray[2]];
            if ([tempStr isEqualToString:@"09"]){
                self.resultLabel.text = @"半顺";
                return;
            }
        }
        
        
    }
    [self jiSuan];
    NSString *jieGuo = @"";
    if([_resultArray[0] integerValue]== 1){
        jieGuo = @"对子";
    }else if([_resultArray[0] integerValue]== 2){
        jieGuo = @"豹子";
    }else if([_resultArray[1] integerValue]== 1){
        jieGuo = @"半顺";
    }else if([_resultArray[1] integerValue]== 2){
        jieGuo = @"顺子";
    }else{
        jieGuo = @"杂六";
    }
    
    self.resultLabel.text = jieGuo;
    
    
}



# pragma mark --- 计算 豹子 对子 顺子
- (void)jiSuan{
    //计算豹子、对子
    NSInteger one = [_dataArray[2] integerValue] - [_dataArray[1] integerValue]== 0 ? 1 : 0;
    NSInteger two = [_dataArray[1] integerValue]- [_dataArray[0] integerValue]== 0 ? ++one : one;
    [_resultArray addObject:@(two)];
    
    //计算顺子、半顺、杂六
    NSInteger three = [_dataArray[2] integerValue] - [_dataArray[1] integerValue] == 1 ? 1 : 0;
    NSInteger four = [_dataArray[1] integerValue]- [_dataArray[0] integerValue] == 1 ? ++three :  three;
    [_resultArray addObject:@(four)];
    
}

- (void)viewDidLayoutSubviews{
    
    [_one mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(35);

        
    }];
    
    
    [_two mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_one.mas_left);
        make.top.equalTo(_one.mas_bottom).offset(35);

        
    }];
    
    [_three mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_two.mas_left);
        make.top.equalTo(_two.mas_bottom).offset(35);

        
    }];
    

    [_resultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_three.mas_left);
        make.top.equalTo(_three.mas_bottom).offset(35);
        
        
        
    }];
    

    
    [_resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_resultBtn.mas_right).offset(15);
        make.centerY.equalTo(_resultBtn.mas_centerY);
        
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}


@end
