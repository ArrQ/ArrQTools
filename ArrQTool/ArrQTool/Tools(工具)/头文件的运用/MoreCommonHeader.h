//
//  MoreCommonHeader.h
//  ArrQTool
//
//  Created by ArrQ on 2018/4/11.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#ifndef MoreCommonHeader_h
#define MoreCommonHeader_h

/**
 
 共用的 block  和 枚举类型 ====== 更好用
 
 **/




typedef NS_ENUM(NSInteger, my_moreIndex){
    
    my_moreIndex_type_ONE              = 0x01,
    my_moreIndex_type_TWO              = 0x02,
    
    
};



typedef void(^blcokStrOne)(NSString *strOne);

typedef void(^blcokArrayOne)(NSArray *arrayOne);

typedef void(^blcokDicOne)(NSDictionary *dicOne);



#endif /* MoreCommonHeader_h */
