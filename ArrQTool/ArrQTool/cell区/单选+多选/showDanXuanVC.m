//
//  showDanXuanVC.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/3.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showDanXuanVC.h"
#import "danxuanCell.h"
#import "DanxuanModel.h"



#import "duoXuanCell.h"

@interface showDanXuanVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataOneModelArray;


@end

@implementation showDanXuanVC

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
      
        [_tableView registerClass:[danxuanCell class] forCellReuseIdentifier:@"danxuanCell"];
        
        [_tableView registerClass:[duoXuanCell class] forCellReuseIdentifier:@"duoXuanCell"];

        
        
    }
    return _tableView;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        danxuanCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"danxuanCell"];
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSLog(@"%@",self.dataOneModelArray);
        
        
        
        [homeCell_000 cellWithData:nil andXuanHaoMoShi:self.dataOneModelArray[indexPath.row] andBlock:^(NSArray *dataArray) {
            
            NSLog(@"====== %@",dataArray);
            
            
        }];
        
        return homeCell_000;
        
    }
    
    duoXuanCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"duoXuanCell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
   
    NSLog(@"%@",self.dataOneModelArray);
    
    
    
    [homeCell_000 cellWithData:nil andXuanHaoMoShi:self.dataOneModelArray[indexPath.row] andBlock:^(NSArray *dataArray) {
        
        NSLog(@"====== %@",dataArray);
        
        
    }];
    
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


- (void)getDataSource{
    
    NSArray *datatitle = [self getdataList];
    
    
    NSMutableArray *cellOneModelArray = [NSMutableArray array];
    
    
        for (int i =0; i<datatitle.count; i++) {
            
            NSDictionary *dicone = datatitle[i];
            
            DanxuanModel *baimodel = [[DanxuanModel alloc]initWithDictionary:dicone error:nil];
            [cellOneModelArray addObject:baimodel];
          
        }
        
        [self.dataOneModelArray removeAllObjects];
    
//        [self.dataOneModelArray addObjectsFromArray:cellOneModelArray];
    
        [self.dataOneModelArray addObject:cellOneModelArray];
        [self.dataOneModelArray addObject:cellOneModelArray];

        
        
      [self.tableView reloadData];
    
    
}




// 获取 杀和值  0-36 数据源
- (NSArray *)getdataList{
    
    NSString *strone = @"0,1,2,3,4,5,6,7,8,9";
    NSArray *dataArray = [strone componentsSeparatedByString:@","];
    NSMutableArray *resultArray = [NSMutableArray array];
    for (int i = 0; i<dataArray.count; i++) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        [dic setObject:@"0" forKey:@"isSearchState"];
        
        [dic setObject:dataArray[i] forKey:@"title"];
        
        [resultArray addObject:dic];
        
    }
    
    
    
    return resultArray;
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
