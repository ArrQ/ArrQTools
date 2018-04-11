//
//  dopDownVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/22.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "dopDownVC.h"

#import "xiaLaZiDingYiVC.h"



@interface dopDownVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) DXPopover * moShiPopover;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * moShiDataArray;

@property (nonatomic,strong) UIButton * titleTypeBtn;


@end

@implementation dopDownVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self markData];
    [self markInitUI];
    
}

- (void)markInitUI{
    
    UIButton *button_up = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_up setTitle:@"打我上" forState:UIControlStateNormal];
    button_up.titleLabel.font = [UIFont systemFontOfSize:14];
    button_up.layer.masksToBounds = YES;
    button_up.layer.cornerRadius = 5;
    
    button_up.layer.borderWidth = 1.f;
    button_up.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_up setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_up addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_up];
    _titleTypeBtn = button_up;
    
    
    [button_up mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.left.equalTo(self.view.mas_left).offset(15);
        make.centerY.equalTo(self.view.mas_centerY);
        
        
    }];
    
    
    
    
    
    //     下 拉 列表
    
    UIButton *button_down = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_down setTitle:@"打我上" forState:UIControlStateNormal];
    button_down.titleLabel.font = [UIFont systemFontOfSize:14];
    button_down.layer.masksToBounds = YES;
    button_down.layer.cornerRadius = 5;
    
    button_down.layer.borderWidth = 1.f;
    button_down.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_down setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_down addTarget:self action:@selector(btnOnClickToDown:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_down];
    
    
    [button_down mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.centerY.equalTo(self.view.mas_centerY);
        
        
    }];
    
    
}


- (void)markData{
    
    
    NSArray *data = @[@"西安",@"北京",@"京东",@"南京"];
    [self.moShiDataArray removeAllObjects];
    [self.moShiDataArray addObjectsFromArray:data];
    
    self.moShiPopover = [DXPopover new];
    self.moShiPopover.maskType = DXPopoverMaskTypeBlack;
    
    
}

- (NSMutableArray *)moShiDataArray{
    
    if (!_moShiDataArray) {
        
        _moShiDataArray = [NSMutableArray array];
        
    }
    
    return _moShiDataArray;
    
}




# pragma mark --- btn onclick ---

- (void)btnOnClick:(UIButton *)sender{
    
    
    [self updateTableViewFrame];
    
    //获取所点击button在self.view上的相对位置
    CGRect rect = [sender convertRect:sender.bounds toView:self.view];
    
    CGPoint startPoint =
    CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect)+rect.size.height);
    [self.moShiPopover showAtPoint:startPoint
                    popoverPostion:0
                   withContentView:self.tableView
                            inView:self.view];
    
    __weak typeof(self) weakSelf = self;
    self.moShiPopover.didDismissHandler = ^{
        [weakSelf bounceTargetView:sender];
    };
    
    
    
    
    
}


- (void)btnOnClickToDown:(UIButton *)sender{
    
    
//    dopDownVC *downVC = [[dopDownVC alloc]init];
//    downVC.title = @"下拉列表";
//    [self.navigationController pushViewController:downVC animated:YES];
//
//
    

   
    
    
    xiaLaZiDingYiVC *downVC = [[xiaLaZiDingYiVC alloc]init];
    downVC.title = @"下拉列表";
    [self.navigationController pushViewController:downVC animated:YES];
    
    
    
    
}








// 弹框 消失
- (void)bounceTargetView:(UIView *)targetView {
    targetView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [UIView animateWithDuration:0.5
                          delay:0.0
         usingSpringWithDamping:0.3
          initialSpringVelocity:5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         targetView.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
}



//

#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    if (!_tableView) {
        
        //        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, 200) style:UITableViewStylePlain];
        
        _tableView = [[UITableView alloc] init];
        
        _tableView.frame = CGRectMake(CGRectGetMaxX(self.titleTypeBtn.frame), CGRectGetMaxY(self.titleTypeBtn.frame)+self.titleTypeBtn.frame.size.height, 50, 44*self.moShiDataArray.count);
        
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
    }
    return _tableView;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.moShiDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    static NSString *cellId = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
        //            cell.textLabel.font = [UIFont systemFontOfSize:13.0];
        
        UILabel *smallLabel = [[UILabel alloc] init];
        smallLabel.frame = CGRectMake(0, 0, self.tableView.frame.size.width, cell.frame.size.height);
        smallLabel.font = [UIFont systemFontOfSize:13];
        smallLabel.backgroundColor = [UIColor whiteColor];
        smallLabel.textAlignment = NSTextAlignmentCenter;
        smallLabel.tag = 2000;
        [cell.contentView addSubview:smallLabel];
        
    }
    UILabel *label = [cell.contentView viewWithTag:2000];
    label.text = self.moShiDataArray[indexPath.row];
    //        cell.textLabel.text = self.moShiDataArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self.moShiPopover dismiss];
    
    [self.titleTypeBtn setTitle:self.moShiDataArray[indexPath.row] forState:UIControlStateNormal];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
}


- (void)updateTableViewFrame {
    CGRect tableViewFrame = self.tableView.frame;
    tableViewFrame.size.width = 80;
    self.tableView.frame = tableViewFrame;
    self.moShiPopover.contentInset = UIEdgeInsetsZero;
    self.moShiPopover.backgroundColor = [UIColor whiteColor];
    
}




- (void)viewDidLayoutSubviews{
    
    
    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

