//
//  YLGoods.h
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLDiscountProtocol.h"

typedef NS_ENUM(NSInteger,kindOfDiscount){
    NODISCOUNT=0,
    PERCENTDISCOUNT=1,
    FULLREDUCE=2,
};
/**结算商品model*/
@interface YLGoods : NSObject

/**商品的名字*/
@property(nonatomic,copy)NSString *name;

/**商品的单价*/
@property(nonatomic,assign)double price;
/**商品的数量*/
@property(nonatomic,assign)NSInteger number;
/**商品的类别*/
@property(nonatomic,copy)NSString *type;
/**条形码*/
@property(nonatomic,copy)NSString *barCode;
/**小计*/
@property(nonatomic,assign)double totalMoney;
/**节省金额*/
@property(nonatomic,assign)double saveMoney;
/**指向遵循打折协议的指针*/
@property(nonatomic,weak)id<YLDiscountProtocol> delegate;

/**享受优惠*/
@property (nonatomic, assign)kindOfDiscount DiscountKind;

@end
