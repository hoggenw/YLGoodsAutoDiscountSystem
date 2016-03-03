//
//  YLFullReduce.m
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import "YLFullReduce.h"
#import "YLGoods.h"

@implementation YLFullReduce
-(YLGoods*)discountWith:(YLGoods*)goods{
    goods.totalMoney=goods.number*goods.price;
    goods.saveMoney=(goods.number/2)*goods.price;
    goods.number=goods.number+(goods.number/2);
    return goods;
}
@end
