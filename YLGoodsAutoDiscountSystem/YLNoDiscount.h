//
//  YLNoDiscount.h
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLDiscountProtocol.h"
//遵守打折协议。没有优惠
@interface YLNoDiscount : NSObject<YLDiscountProtocol>

@end
