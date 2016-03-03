//
//  YLPercenttDiscount.h
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLDiscountProtocol.h"
//遵守打折协议,百分比优惠
@interface YLPercentDiscount : NSObject<YLDiscountProtocol>
/**
 *  打折的百分比
 */
@property(nonatomic,assign)double percent;
/**初始化*/
-(instancetype)initWithPercent:(double)percent;

/**类方法创建打折对象*/
+(instancetype)percentWithPercent:(double)percent;

@end
