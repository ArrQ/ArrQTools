//
//  BottomZuoHaoView.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "BottomZuoHaoView.h"
#import "ZuoHaoTableViewCell.h"
//#import "MBProgressHUD+MyExtension.h"

@interface BottomZuoHaoView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UIControl *bgView;

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) UIButton *closeBtn;



@end


@implementation BottomZuoHaoView

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
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[ZuoHaoTableViewCell class] forCellReuseIdentifier:@"ZuoHaoTableViewCell"];
        
        
        
        
    }
    return _tableView;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.frame.size.height-100;
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZuoHaoTableViewCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"ZuoHaoTableViewCell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!homeCell_000) {
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        homeCell_000 = [[ZuoHaoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZuoHaoTableViewCell"];
        
        
    }
    
    
    
    [homeCell_000 cellWithDic:self.dataArray];
    
    
    homeCell_000.blockBtn = ^(NSString *index) {
      
        if (self.blockCopyBtn) {
            
            self.blockCopyBtn(index);
            
        }
        
        XSInfoViewStyle *infoStyle = [[XSInfoViewStyle alloc]init];
        NSString *strone;
        if ([index integerValue] == 1) {// 复制成功
            
            if (self.dataArray.count>0) {
                
                strone = @"复制成功";


            }else{
                strone = @"没有数据";


            }
            
        }else if ([index integerValue] == 0){
            
            strone = @"已经取反";

  
            
        }
        
        infoStyle.info = strone;
        [XSInfoView showInfoWithStyle:infoStyle onView:self];

        
    };

    
    
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
        make.centerX.equalTo(self.mas_centerX).offset(-20);
        make.bottom.equalTo(self.mas_bottom).offset(-25);
        
    }];
    
    
    
}


@end
