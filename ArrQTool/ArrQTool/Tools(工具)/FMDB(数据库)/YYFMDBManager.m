//
//  YYFMDBManager.m
//  ArrQTool
//
//  Created by ArrQ on 2018/1/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YYFMDBManager.h"


#import "FMDB.h"


//#define DBNAME @"myApp.sqlite"

#define DBNAME @"ShangPinData.db"
#define DBTable @"ShangPinDataTableOne"


@interface YYFMDBManager ()

@property (nonatomic, strong) FMDatabase *db;

@end


@implementation YYFMDBManager


static YYFMDBManager *manager = nil;

+ (YYFMDBManager *)shareManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
        [manager getOpen];
    });
    return manager;
}

- (void)getOpen{
    // copy"area.sqlite"到Documents中
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory =[paths objectAtIndex:0];
    NSString *txtPath =[documentsDirectory stringByAppendingPathComponent:DBNAME];
    if([fileManager fileExistsAtPath:txtPath] == NO){
        
        NSArray *dataName = [DBNAME componentsSeparatedByString:@"."];
        NSString *resourcePath =[[NSBundle mainBundle] pathForResource:dataName[0] ofType:dataName[1]];
        [fileManager copyItemAtPath:resourcePath toPath:txtPath error:&error];
    }
    // 新建数据库并打开
    NSString *path  = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:DBNAME];
    
    NSLog(@"路径path--%@",path);
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    self.db = db;
    BOOL success = [db open];
    if (success) {
        // 数据库创建成功!
        NSLog(@"数据库创建成功!");
        NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS ShangPinDataTableOne (id INTEGER, cid TEXT, name TEXT, parent_cid TEXT, is_parent TEXT, status TEXT, taosir_cat TEXT, attr_key TEXT, attr_value TEXT, sort INTEGER, isuse INTEGER, candel INTEGER);";// 
        BOOL successT = [self.db executeUpdate:sqlStr];
        if (successT) {
            // 创建表成功!
            
            NSLog(@"创建表成功!");
        }else{
            // 创建表失败!
            NSLog(@"创建表失败!");
            [self.db close];
        }
    }else{
        // 数据库创建失败!
        NSLog(@"数据库创建失败!");
        [self.db close];
    }
}

- (void)getParentName:(void (^)(NSArray *, NSArray *))result {
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT DISTINCT cid,name FROM ShangPinDataTableOne WHERE parent_cid = '0';"];
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    NSMutableArray *tempCidArray = [[NSMutableArray alloc] init];
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"name"];
        NSString *cid = [resultSet stringForColumn:@"cid"];
        [tempNameArray addObject:name];
        [tempCidArray addObject:cid];
    }
    result(tempNameArray, tempCidArray);
}

- (void)getSecondaryClassificationName:(NSArray *)cidArray result:(void (^)(NSArray *,NSArray *))result {
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    NSMutableArray *tempCidArray = [[NSMutableArray alloc] init];
    for (NSString *cid in cidArray) {
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT cid,name FROM ShangPinDataTableOne WHERE parent_cid = '%@';",cid];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"name"];
            NSString *cid = [resultSet stringForColumn:@"cid"];
            [tempNameArray addObject:name];
            [tempCidArray addObject:cid];
        }
    }
    result(tempNameArray,tempCidArray);
}





@end
