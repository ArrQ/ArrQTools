//
//  WuXingSelectListView.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/19.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "WuXingSelectListView.h"
#import "WuXingSelectListTableViewCell.h"
#import "WuXingSelectListModel.h"

@interface WuXingSelectListView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UIControl *bgView;

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) UIButton *closeBtn;

@property(nonatomic,strong) NSMutableArray *xuanArray;

@property(nonatomic,strong) NSString *titleName;

@property(nonatomic,strong) NSString *isSelected;// 0 是取消

@end


@implementation WuXingSelectListView

- (NSMutableArray *)xuanArray{
    
    if (!_xuanArray) {
        
        _xuanArray = [NSMutableArray array];
        
        
    }
    
    return _xuanArray;
    
    
    
}

- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
        
        
    }
    
    return _dataArray;
    
}


- (UIControl *)bgView{
    
    if (!_bgView) {
        
        _bgView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_bgView addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];

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
    
    [button_close setTitle:@"确定" forState:UIControlStateNormal];
    button_close.titleLabel.font = [UIFont systemFontOfSize:21];
//    button_close.layer.masksToBounds = YES;
//    button_close.layer.cornerRadius = 44/2;
//
//    button_close.layer.borderWidth = 2.0f;
//    button_close.layer.borderColor = [[UIColor whiteColor]CGColor];
    [button_close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_close addTarget:self action:@selector(closeBtn:) forControlEvents:UIControlEventTouchUpInside];
    button_close.backgroundColor = xingxingBtnBg;
    [self addSubview:button_close];
    
    _closeBtn = button_close;
    
 
    
    
    
    
    
    
}



# pragma mark --- 确定 ----
- (void)closeBtn:(UIButton *)sender{
    
    __weak typeof (self) weakSelf = self;
    self.isSelected = @"1";

//    sender.selected = !sender.selected;
//
//    if (sender.selected) {
//
//        sender.backgroundColor = xingxingBtnBg;
//
//
//    }else{
//
////        sender.backgroundColor = [UIColor whiteColor];
//        sender.backgroundColor = xingxingBtnBg;
//
//
//    }
    
    
    
    if (self.xuanArray.count>0) {
        
        if (self.blockSureXuan) {
            
            self.blockSureXuan(self.xuanArray, self.isSelected);
            
        }
        
        self.bgView.hidden = YES;
        
        
    }else{
        
        XSInfoViewStyle *style = [[XSInfoViewStyle alloc]init];
        
        style.info = @"请选择";
        
        [XSInfoView showInfoWithStyle:style onView:self];

        
    }
    

   
    
    
    
}




# pragma mark --- view  显示 隐藏 ---

- (void)showView:(NSArray *)dataArray andTitleName:(NSString *)titleName{
    self.isSelected = @"0";
    self.titleName = titleName;
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
    self.bgView.hidden = NO;
    [self.tableView reloadData];
    
    
}


- (void)hideView{
    
    self.isSelected = @"0";

    self.bgView.hidden = YES;
    
}






#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-44) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[WuXingSelectListTableViewCell class] forCellReuseIdentifier:@"WuXingSelectListTableViewCell"];
        
        
        
        
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
    
    UILabel *labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    
    labtitle.backgroundColor = [UIColor whiteColor];
//    labtitle.text = @"   五星012";
    labtitle.text = [NSString stringWithFormat:@"   %@",self.titleName];

    return labtitle;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WuXingSelectListTableViewCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"WuXingSelectListTableViewCell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!homeCell_000) {
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        homeCell_000 = [[WuXingSelectListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WuXingSelectListTableViewCell"];
        
        
    }
    
    
    [homeCell_000 cellWithModel:self.dataArray[indexPath.row]];
    
    if (indexPath.row%2 == 0) {
        
        
        homeCell_000.backgroundColor = xingxingcellBg;
        
        
    }else{
        
        homeCell_000.backgroundColor = [UIColor whiteColor];
        
        
    }
    
    
    return homeCell_000;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
    
    
    NSMutableArray *data = [NSMutableArray array];
    
    
    for (int i = 0; i<self.dataArray.count; i++) {
        
        WuXingSelectListModel *model = self.dataArray[i];
        if (indexPath.row == i) {
            
            model = self.dataArray[indexPath.row];
            
            if ([model.isSearchState integerValue] == 1) {
                
                model.isSearchState = @"0";
                
                
            }else{
                
                model.isSearchState = @"1";
                
                
            }
            
            [data addObject:model];
            
        }else{
            
            [data addObject:model];
            
            
            
        }
        
        
        
        
    }
    
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:data];
    
    NSMutableArray *isselected = [NSMutableArray array];
    for (WuXingSelectListModel *model in self.dataArray) {
        
        if ([model.isSearchState integerValue] == 1) {
            
            [isselected addObject:model.title];
            
            
        }
        
    }
    
    [self.xuanArray removeAllObjects];
    [self.xuanArray addObjectsFromArray:isselected];
    
    [self.tableView reloadData];
    
  
    
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
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 44));
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    
    
}




@end
