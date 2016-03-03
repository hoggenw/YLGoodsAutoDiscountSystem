//
//  YLDiscountProtocol.h
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/3.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLGoods;
@protocol YLDiscountProtocol <NSObject>
/**优惠后价格*/
-(YLGoods*)discountWith:(YLGoods *)goods;

@end
