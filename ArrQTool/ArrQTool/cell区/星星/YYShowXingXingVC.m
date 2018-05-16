//
//  YYShowXingXingVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YYShowXingXingVC.h"


#import "BaseXingXingModel.h"


#import "yyshowxingxingOneTableViewCell.h"
#import "showduoxuanTableViewCell.h"

#import "showDaxiaojiouTableViewCell.h"


#import "xingxingSectionTitleView.h"


@interface YYShowXingXingVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataOneModelArray;


@end

@implementation YYShowXingXingVC

- (NSMutableArray *)dataOneModelArray{
    
    if (!_dataOneModelArray) {
        
        _dataOneModelArray = [NSMutableArray array];
        
    }
    
    return _dataOneModelArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getDataSource];
    [self.view addSubview:self.tableView];
    
    
}



#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = [UIScreen mainScreen].bounds;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-64-49) style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[yyshowxingxingOneTableViewCell class] forCellReuseIdentifier:@"yyshowxingxingOneTableViewCell"];
        
        [_tableView registerClass:[showduoxuanTableViewCell class] forCellReuseIdentifier:@"showduoxuanTableViewCell"];
        
        [_tableView registerClass:[showDaxiaojiouTableViewCell class] forCellReuseIdentifier:@"showDaxiaojiouTableViewCell"];

        
    }
    return _tableView;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    
    return self.dataOneModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.dataOneModelArray[section];
    
    return arr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(indexPath.section == 1){
        
        return 40;
        
        
    }
    
    return 40;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 40;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    xingxingSectionTitleView *titleView = [[xingxingSectionTitleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    
    
    return titleView;
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        
        
        if(indexPath.row == 2){

            showDaxiaojiouTableViewCell  *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"showDaxiaojiouTableViewCell"];
            homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            [homeCell_000 cellWithData:nil andXuanHaoMoShi:self.dataOneModelArray[indexPath.section][indexPath.row] andBlock:^(NSArray *dataArray) {
                
                NSLog(@"====== %@",dataArray);

                
            }];
            
           
            
            return homeCell_000;
            
        
        }else{
            
            showduoxuanTableViewCell  *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"showduoxuanTableViewCell"];
            homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            [homeCell_000 cellWithData:nil andIndexPath:indexPath andXuanHaoMoShi:self.dataOneModelArray[indexPath.section][indexPath.row] andBlock:^(NSArray *dataArray) {
                
                
                NSLog(@"====== %@",dataArray);
                
                
                
            }];
            
            
            return homeCell_000;
            
            
        }
       
        
        
    }else if (indexPath.section == 1){
        
        showduoxuanTableViewCell  *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"showduoxuanTableViewCell"];
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        [homeCell_000 cellWithData:nil andIndexPath:indexPath andXuanHaoMoShi:self.dataOneModelArray[indexPath.section][indexPath.row] andBlock:^(NSArray *dataArray) {
            
            
            NSLog(@"====== %@",dataArray);
            
            
            
        }];
        
        
        return homeCell_000;
        
        
        
    }
    
    return nil;

    
    
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


# pragma mark --- 数据处理
- (void)getDataSource{
    

    
    NSMutableArray *sectionOneArr = [NSMutableArray array];
    NSMutableArray *sectionTwoArr = [NSMutableArray array];

    [sectionOneArr removeAllObjects];
    [sectionOneArr addObject:[self getdataList]];
    [sectionOneArr addObject:[self getdataList]];

    [sectionOneArr addObject:[self getdataQuanQingJiOuList]];

    
    
    [sectionTwoArr removeAllObjects];
    [sectionTwoArr addObject:[self getdataList]];
    
    
    
    [self.dataOneModelArray removeAllObjects];
    
    [self.dataOneModelArray addObject:sectionOneArr];

    [self.dataOneModelArray addObject:sectionTwoArr];
    
    
    
    [self.tableView reloadData];
    
    
}




// 获取 杀和值  0-36 数据源
- (NSArray *)getdataList{
    
    NSArray *dataArray = @[@{@"isSearchState":@"0",@"title":@"0"},
                             @{@"isSearchState":@"0",@"title":@"1"},
                             @{@"isSearchState":@"0",@"title":@"2"},
                             @{@"isSearchState":@"0",@"title":@"3"},
                             @{@"isSearchState":@"0",@"title":@"4"},
                             @{@"isSearchState":@"0",@"title":@"5"},
                             @{@"isSearchState":@"0",@"title":@"6"},
                             @{@"isSearchState":@"0",@"title":@"7"},
                             @{@"isSearchState":@"0",@"title":@"8"},
                             @{@"isSearchState":@"0",@"title":@"9"}
                     ];
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dicone = dataArray[i];
        
        BaseXingXingModel *baimodel = [[BaseXingXingModel alloc]initWithDictionary:dicone error:nil];
        
      
        
        [resultArray addObject:baimodel];
        
    }
    
    return resultArray;
    
}



- (NSArray *)getdataQuanQingJiOuList{
    
    NSArray *dataArray = @[@{@"isSearchState":@"0",@"title":@"全"},
                           @{@"isSearchState":@"0",@"title":@"大"},
                           @{@"isSearchState":@"0",@"title":@"小"},
                           @{@"isSearchState":@"0",@"title":@"奇"},
                           @{@"isSearchState":@"0",@"title":@"偶"},
                           @{@"isSearchState":@"0",@"title":@"清"}
                           ];
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i<dataArray.count; i++) {
        
        NSDictionary *dicone = dataArray[i];
        
        BaseXingXingModel *baimodel = [[BaseXingXingModel alloc]initWithDictionary:dicone error:nil];
        [resultArray addObject:baimodel];
        
    }
    
    return resultArray;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
