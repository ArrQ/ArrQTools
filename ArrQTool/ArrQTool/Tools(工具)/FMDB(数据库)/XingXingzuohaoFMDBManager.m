//
//  XingXingzuohaoFMDBManager.m
//  ArrQTool
//
//  Created by ArrQ on 2018/1/13.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "XingXingzuohaoFMDBManager.h"

#import "FMDB.h"


#define DBNAME @"xingxingzuohao.db"
#define DBTable @"四星做号"

@interface XingXingzuohaoFMDBManager ()

@property (nonatomic, strong) FMDatabase *db;


@end


@implementation XingXingzuohaoFMDBManager

static XingXingzuohaoFMDBManager *manager = nil;

+ (XingXingzuohaoFMDBManager *)shareManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
        
//        [manager getOpen];
        
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
        NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS 四星号 (ID INTEGER, 号码 TEXT, 和值 TEXT, 跨度 TEXT, 路012 TEXT, 大小 TEXT, 奇偶 TEXT, 边中 TEXT, 组选 TEXT, 上山 INTEGER, 下山 INTEGER,凸型 INTEGER,凹型 INTEGER,N型 INTEGER,反N型 INTEGER,不连 INTEGER, 二连 INTEGER,三连 INTEGER,四连 INTEGER,二码和 INTEGER,二码差 INTEGER,AC值 INTEGER);";
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

- (void)gethezhihaoma:(NSString *)heZhiName andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 和值 = '%ld';",[heZhiName integerValue]];
    FMResultSet *resultSet = [self.db executeQuery:sql];
    
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"号码"];
        [tempNameArray addObject:name];
        
     
    }
    result(tempNameArray);

    
}


//- (void)getHezhihaomaWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
//
//
//    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
//
//    for (NSString *str in dataArray) {
//
//        NSMutableArray *oneArr = [NSMutableArray array];
//        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 和值 = '%ld';",[str integerValue]];
//        FMResultSet *resultSet = [self.db executeQuery:sql];
//
//        while ([resultSet next]) {
//            NSString *name = [resultSet stringForColumn:@"号码"];
//            [oneArr addObject:name];
//
//
//        }
//
//        [tempNameArray addObjectsFromArray:oneArr];
//
//
//
//    }
//
//    result(tempNameArray);
//
//
//
//}


// 补充

// 获取 跨度 数据
- (void)getKuaDuWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 跨度 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}

// 获取 和值 数据
- (void)getHezhihaomaWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 和值 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
    
}

// 获取 大小 数据

- (void)getDaXiaoWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 大小 = '%@';",str];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
    
    
    
}

// 获取 奇偶 数据

- (void)getJiOuWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 奇偶 = '%@';",str];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}


// 获取 012路 数据

- (void)getShiErLuWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 路012 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}

// 获取 形态号 数据


- (void)getXingTaiHaoWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE %@ = '1';",str];// 1 代表 成功
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
    
}



// 获取 组选 数据

- (void)getZuXuanWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 组选 = '%@';",str];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}



// 获取 二码组合 数据

- (void)getErMaZuHeWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 和值 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}


// 获取 二码和 数据

-(void)getErMaHeWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 二码和 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
}


// 获取 二码差 数据

- (void)getErMaChaWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE 二码差 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}

// 获取 AC 数据

- (void)getACWithArray:(NSArray *)dataArray andResult:(void (^)(NSArray *))result{
    
    NSMutableArray *tempNameArray = [[NSMutableArray alloc] init];
    
    for (NSString *str in dataArray) {
        
        NSMutableArray *oneArr = [NSMutableArray array];
        NSString *sql = [NSString stringWithFormat:@"SELECT DISTINCT 号码 FROM 四星号 WHERE AC值 = '%ld';",[str integerValue]];
        FMResultSet *resultSet = [self.db executeQuery:sql];
        
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"号码"];
            [oneArr addObject:name];
            
            
        }
        
        [tempNameArray addObjectsFromArray:oneArr];
        
        
        
    }
    
    result(tempNameArray);
    
    
}

@end


