//
//  showxuanzhuangViewController.m
//  TableViewThransform
//
//  Created by ArrQ on 2017/12/12.
//  Copyright © 2017年 bukaopu. All rights reserved.
//

#import "showxuanzhuangViewController.h"
#import "allTableViewCell.h"
#import "allview.h"

#define k_screenWidth [UIScreen mainScreen].bounds.size.width
#define k_screenHeight [UIScreen mainScreen].bounds.size.height

@interface showxuanzhuangViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) allview *alllvi;

@end

@implementation showxuanzhuangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    _alllvi = [[allview alloc]init];
    //    _alllvi.frame = CGRectMake(0, 0, k_screenWidth, 200);
    ////
    //    _alllvi.backgroundColor = [UIColor redColor];
    ////    // 记录中心点
    //    CGPoint pointCenter = _alllvi.center;
    //    _alllvi.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    //    _alllvi.frame = CGRectMake(0, 0, k_screenWidth,200);
    //    _alllvi.center = pointCenter;
    //    [self.view addSubview:_alllvi];
    //
    //
    
    
    [self.view addSubview:self.tableView];
    
    
    
    
    
}






#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, k_screenWidth, 200) style:UITableViewStylePlain];
        
        
        //    // 记录中心点
        CGPoint pointCenter = _tableView.center;
        _tableView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        _tableView.frame = CGRectMake(0, 20, k_screenWidth,200);
        _tableView.center = pointCenter;
        
        
        
        _tableView.bounces = YES;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[allTableViewCell class] forCellReuseIdentifier:@"homecell"];
        
        
        
        
    }
    return _tableView;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    allTableViewCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"homecell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!homeCell_000) {
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        homeCell_000.backgroundColor = [UIColor whiteColor];
        homeCell_000 = [[allTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homecell"];
        
        
    }
    
    return homeCell_000;
    
    
}


@end
