//
//  YLManageSystem.h
//  YLBookAutoDiscountSystem
//
//  Created by 千锋 on 15/11/19.
//  Copyright (c) 2015年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLDiscountProtocol.h"
#import "YLManageSystem.h"

/**打印小票模块*/
@interface YLManageSystem : NSObject{
    NSArray *goodsBaskat;
    NSMutableArray *sellModelBaskat;
}
/**从商品篮子里面接受商品,返回输出内容*/
-(NSString*)totalGoods:(NSData*)jsonData;

@end
