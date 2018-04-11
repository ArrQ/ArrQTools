//
//  DetailTitleView.m
//  ArrQTool
//
//  Created by ArrQ on 2018/2/22.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "DetailTitleView.h"


@implementation DetailTitleView

- (void)creatTitleView
{
    self.titleTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,160, 250) style:UITableViewStylePlain];
    self.titleTableView.delegate = self;
    self.titleTableView.dataSource = self;
    self.titleTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datailArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate changeTitle:self.datailArray[indexPath.row] and:(int)indexPath.row];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.textAlignment = 1;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    CathecticModel * model = self.datailArray[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

@end
