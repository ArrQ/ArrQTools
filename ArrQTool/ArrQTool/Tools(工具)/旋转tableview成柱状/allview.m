//
//  allview.m
//  TableViewThransform
//
//  Created by ArrQ on 2017/11/25.
//  Copyright © 2017年 bukaopu. All rights reserved.
//

#import "allview.h"

#define k_screenWidth [UIScreen mainScreen].bounds.size.width
#define k_screenHeight [UIScreen mainScreen].bounds.size.height


@interface allview ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@end
@implementation allview

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    [self addSubview:self.tableView];
    
    
}

#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, k_screenWidth) style:UITableViewStylePlain];
        _tableView.bounces = NO;
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
