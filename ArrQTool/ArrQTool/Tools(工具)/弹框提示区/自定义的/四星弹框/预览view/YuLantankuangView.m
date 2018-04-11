//
//  YuLantankuangView.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YuLantankuangView.h"


@interface YuLantankuangView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UIControl *bgView;

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) UIButton *closeBtn;




@end


@implementation YuLantankuangView

- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {

        _dataArray = [NSMutableArray array];
        
        
    }
    
    return _dataArray;
    
}


- (UIControl *)bgView{
    
    if (!_bgView) {
        
        _bgView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        _bgView.hidden = YES;
        [_bgView addSubview:self];
        
        [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
        
    }
    
    
    return _bgView;
    
}





- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    [self addSubview:self.tableView];
    
    UIButton *button_close = [UIButton buttonWithType:UIButtonTypeCustom];

    [button_close setTitle:@"×" forState:UIControlStateNormal];
    button_close.titleLabel.font = [UIFont systemFontOfSize:38];
    button_close.layer.masksToBounds = YES;
    button_close.layer.cornerRadius = 44/2;

    button_close.layer.borderWidth = 2.0f;
    button_close.layer.borderColor = [[UIColor whiteColor]CGColor];
    [button_close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_close addTarget:self action:@selector(closeBtn:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:button_close];

    _closeBtn = button_close;
    
  
}


- (void)closeBtn:(UIButton *)sender{
    
    
    self.bgView.hidden = YES;

    
    
    
}




# pragma mark --- view  显示 隐藏 ---

- (void)showView:(NSArray *)dataArray{
    
    
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
    self.bgView.hidden = NO;
    [self.tableView reloadData];
    
}



- (void)hideView{
    
    self.bgView.hidden = YES;
    
}






#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-100) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
      
        [_tableView registerClass:[YuLanTableViewCell class] forCellReuseIdentifier:@"homeCell"];
        
        
        
        
    }
    return _tableView;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    
    labtitle.backgroundColor = [UIColor whiteColor];
    labtitle.text = @"   条件预览";
    
    return labtitle;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YuLanTableViewCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!homeCell_000) {
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        homeCell_000 = [[YuLanTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell"];
        
        
    }
    

    [homeCell_000 cellWithModel:self.dataArray[indexPath.row]];
    if (indexPath.row%2 == 0) {
        

        homeCell_000.backgroundColor = xingxingcellBg;

        
    }else{
        
        homeCell_000.backgroundColor = [UIColor whiteColor];

        
    }
    
    
    return homeCell_000;
    
    
}

//去除tableView 悬浮办法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight;
    sectionHeaderHeight = 20+64;
    if (scrollView == _tableView) {
        //去掉UItableview的section的headerview黏性
        if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}



- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {


        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerX.equalTo(self.mas_centerX).offset(-15);

        make.bottom.equalTo(self.mas_bottom).offset(-25);

    }];


    
}




@end
