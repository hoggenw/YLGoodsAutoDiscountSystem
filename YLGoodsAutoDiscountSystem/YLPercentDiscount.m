//
//  YLPercenttDiscount.m
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import "YLPercentDiscount.h"
#import "YLGoods.h"

@implementation YLPercentDiscount
//打折方法
-(YLGoods*)discountWith:(YLGoods*)goods{
    goods.totalMoney=(1-self.percent)*goods.price*goods.number;
    goods.saveMoney=goods.price*goods.number-goods.totalMoney;
    return goods;
}
//初始化
-(instancetype)initWithPercent:(double)percent{
    if (self=[super init]) {
        _percent=percent;
    }
    return self;
}
//类方法
+(instancetype)percentWithPercent:(double)percent{
    return [[self alloc]initWithPercent:percent];
}
@end
