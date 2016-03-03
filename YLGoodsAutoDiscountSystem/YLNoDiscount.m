//
//  YLNoDiscount.m
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import "YLNoDiscount.h"
#import "YLGoods.h"

@implementation YLNoDiscount

/**不打折的方法*/
-(YLGoods*)discountWith:(YLGoods*)goods{
    goods.totalMoney=goods.number*goods.price;
    goods.saveMoney=0;
    return goods;
}
@end
