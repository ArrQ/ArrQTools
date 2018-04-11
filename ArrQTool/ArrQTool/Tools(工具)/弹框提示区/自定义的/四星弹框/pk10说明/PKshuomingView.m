//
//  PKshuomingView.m
//  ZuoHaoManager
//
//  Created by ArrQ on 2018/1/25.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "PKshuomingView.h"

#import "PKshuomingCell.h"

#import "PKCellSectionTitle.h"

@interface PKshuomingView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) UIControl *bgView;

@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) NSMutableArray *cellsectionDataArray;

@property(nonatomic,strong) UIButton *closeBtn;

@property(nonatomic,strong) UILabel *titleHeaderLab;


@end


@implementation PKshuomingView

- (NSMutableArray *)cellsectionDataArray{
    
    if (!_cellsectionDataArray) {
        
        _cellsectionDataArray = [NSMutableArray array];
        
        
    }
    
    return _cellsectionDataArray;
    
    
    
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

- (UILabel *)titleHeaderLab{
    
    if (!_titleHeaderLab) {
        
        _titleHeaderLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
        
        
        _titleHeaderLab.backgroundColor = [UIColor whiteColor];
        _titleHeaderLab.text = @"两位和";
        _titleHeaderLab.font = kFontB(17);
        _titleHeaderLab.textAlignment = NSTextAlignmentCenter;
        _titleHeaderLab.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        
        
        
        
        
    }
    
    return _titleHeaderLab;
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        [self customSubViews];
        
    }
    
    
    return self;
    
}



- (void)customSubViews{
    
    
    [self addSubview:self.tableView];
    self.tableView.tableHeaderView = self.titleHeaderLab;
    UIButton *button_close = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button_close setTitle:@"关闭" forState:UIControlStateNormal];
    button_close.titleLabel.font = [UIFont systemFontOfSize:21];
    //    button_close.layer.masksToBounds = YES;
    //    button_close.layer.cornerRadius = 44/2;
    //
    //    button_close.layer.borderWidth = 2.0f;
    //    button_close.layer.borderColor = [[UIColor whiteColor]CGColor];
    [button_close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_close addTarget:self action:@selector(closeBtn:) forControlEvents:UIControlEventTouchUpInside];
    button_close.backgroundColor = xingxingbullBg;
    [self addSubview:button_close];
    
    _closeBtn = button_close;
    
    
    
}

# pragma mark --- view  显示 隐藏 ---

- (void)showView:(NSString *)type andTitleName:(NSString *)titleName{
    
    NSArray *dataOne = @[@"号码之中第一位和第二位号码的和",@"号码之中第一位和第三位号码的和",@"号码之中第二位和第三位号码的和"];
    NSArray *dataTwo = @[@"号码01 02 03则12位之和 = 1 + 2 = 3",@"号码01 02 03则13位之和 = 1 + 3 = 4",@"号码01 02 03则23位之和 = 2 + 3 = 5"];

    NSMutableArray *typeOneArray = [NSMutableArray array];
    
    [typeOneArray addObject:dataOne];
    [typeOneArray addObject:dataTwo];

    
    NSArray *dataOnecha = @[@"号码之中第一位和第二位号码的差",@"号码之中第一位和第三位号码的差",@"号码之中第二位和第三位号码的差"];
    NSArray *dataTwocha = @[@"号码01 02 03则12位之差 = 1 - 2 = |1|",@"号码01 02 03则13位之差 = 1 - 3 = |2|",@"号码01 02 03则23位之差 = 2 - 3 = |1|"];
    
    NSMutableArray *typeOneArraycha = [NSMutableArray array];
    
    [typeOneArraycha addObject:dataOnecha];
    [typeOneArraycha addObject:dataTwocha];
    
    
    if ([type integerValue] == 0) {// 和 的说明
        
        [self.dataArray removeAllObjects];

        [self.dataArray addObjectsFromArray:typeOneArray];

        self.titleHeaderLab.text = @"两位和";

        
    }else if ([type integerValue] == 1){// 差的 说明
        
        [self.dataArray removeAllObjects];
        
        [self.dataArray addObjectsFromArray:typeOneArraycha];
        self.titleHeaderLab.text = @"两位差";

        
    }
    
   
    self.bgView.hidden = NO;
    [self.tableView reloadData];
    
    
}



# pragma mark --- 确定 ----
- (void)closeBtn:(UIButton *)sender{
    
    [self hideView];
    
}
- (void)hideView{
    
    
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
        _tableView.bounces = NO;
        [_tableView registerClass:[PKshuomingCell class] forCellReuseIdentifier:@"PKshuomingCell"];
        
        
        
        
    }
    return _tableView;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *datatitle = self.dataArray[section];
    
    return datatitle.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        
        return 40;
        
    }else if (section == 1){
        
        return 40;
        
    }
    return 0;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    PKCellSectionTitle *titleView = [[PKCellSectionTitle alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    
    if (section == 0) {
        
        titleView.titleLab.text = @"解释:";
        
    }else if (section == 1){
        
        titleView.titleLab.text = @"示例:";

        
        
    }
    
    
    
    return titleView;
    
    
//    if (section == 0) {
//
//        UILabel *labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
//
//        labtitle.backgroundColor = [UIColor whiteColor];
//        labtitle.text = @"  解释";
//        labtitle.font = kFontB(17);
//        labtitle.textAlignment = NSTextAlignmentLeft;
//        labtitle.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
//
//        return labtitle;
//
//
//
//    }else if(section == 1){
//
////        UILabel *labtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
////
////        labtitle.backgroundColor = [UIColor whiteColor];
////        labtitle.text = @"  示例";
////        labtitle.font = kFontB(17);
////        labtitle.textAlignment = NSTextAlignmentLeft;
////        labtitle.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
//
//        return titleView;
//
//    }else{
//
//        return nil;
//
//    }
//
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PKshuomingCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"PKshuomingCell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *datatitle = self.dataArray[indexPath.section];
    
    [homeCell_000 cellWithdata:datatitle[indexPath.row]];
   
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
        
        
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 44));
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    
    
    
}



@end
