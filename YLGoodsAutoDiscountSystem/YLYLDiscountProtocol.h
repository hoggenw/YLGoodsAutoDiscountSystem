//
//  YLYLDiscountProtocol.h
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YLYLDiscountProtocol <NSObject>
/**优惠后价格*/
-(double)discountWith:(double)price;
@end
