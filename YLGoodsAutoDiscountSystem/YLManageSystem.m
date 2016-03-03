
//
//  YLManageSystem.m
//  YLBookAutoDiscountSystem
//
//  Created by 千锋 on 15/11/19.
//  Copyright (c) 2015年 mobiletrain. All rights reserved.
//

#import "YLManageSystem.h"
#import "YLGoods.h"
#import "YLPercentDiscount.h"
#import "YLFullReduce.h"
#import "YLNoDiscount.h"
@implementation YLManageSystem{
    BOOL puout;
}
/**从商品篮子里面接受商品,返回输出内容*/
-(NSString *)totalGoods:(NSData *)jsonData{
    if(!sellModelBaskat){
        sellModelBaskat=[NSMutableArray array];
    }else{
        [sellModelBaskat removeAllObjects];
    }
    goodsBaskat=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    NSArray *array=[userDef objectForKey:@"DISCOUNT"];
    //解析json数据，并分离字符串，将卖出数据赋给卖出商品model
    for (NSString *temp in goodsBaskat) {
        YLGoods *goods=[[YLGoods alloc]init];
        NSRange range=[temp rangeOfString:@"-"];
        if (range.length==0) {
            goods.barCode=temp;
            goods.number=1;
        }else{
            goods.barCode=[temp componentsSeparatedByString:@"-"][0];
            goods.number=[[temp componentsSeparatedByString:@"-"][1] integerValue];
        }
        for (int index=0; index<array.count; index++) {
            NSDictionary *dict=array[index];
            if ([[[dict allKeys]firstObject] isEqualToString:goods.barCode] ) {
                NSArray *dictArray=dict[goods.barCode];
                goods.name=dictArray[0];
                goods.DiscountKind=[dictArray[1] integerValue];
                goods.price=[dictArray[2] doubleValue];
                goods.type=dictArray[3];
                [sellModelBaskat addObject:[self completeMessageOfGoods:goods]];
                break;
            }
        }
        
    }
    //输出字符串
    
    return [self putOutString:sellModelBaskat];
}

/**输出字符串*/
-(NSString *)putOutString:(NSArray *)array{
    NSMutableString *basicString=[NSMutableString stringWithString:@"\n***<没钱赚商店>购物清单***\n"];
    NSMutableString *addString=[NSMutableString string];
    double totalMoney=0;
    double saveMoney=0;
    for (YLGoods *goods in array) {
        if (goods.DiscountKind==NODISCOUNT) {
            [basicString appendString:[NSString stringWithFormat:@"名称：%@，数量：%ld%@，单价：%.2lf(元)，小计：%.2lf(元)\n",goods.name,(long)goods.number,goods.type,goods.price,goods.totalMoney]];
            
        }else if (goods.DiscountKind==PERCENTDISCOUNT) {
             [basicString appendString:[NSString stringWithFormat:@"名称：%@，数量：%ld%@，单价：%.2lf(元)，小计：%.2lf(元),节省%.2lf(元)\n",goods.name,(long)goods.number,goods.type,goods.price,goods.totalMoney,goods.saveMoney]];
       
            
        }else if (goods.DiscountKind==FULLREDUCE){
            [basicString appendString:[NSString stringWithFormat:@"名称：%@，数量：%ld%@，单价：%.2lf(元)，小计：%.2lf(元)\n",goods.name,(long)goods.number,goods.type,goods.price,goods.totalMoney]];
            if (puout==NO) {
                [addString appendString:@"-----------------------\n买二赠一商品：\n"];
                puout=YES;
            }
            [addString appendString:[NSString stringWithFormat:@"名称：%@，数量：%.0f%@\n",goods.name,(goods.number-(goods.totalMoney/goods.price)),goods.type]];
            
        }
        totalMoney+=goods.totalMoney;
        saveMoney+=goods.saveMoney;
    }
    NSString *totalStaring=[NSString stringWithFormat:@"-----------------------\n总计：%.2lf(元)\n节省：%.2lf（元）\n**********************",totalMoney,saveMoney];
    [basicString appendString:addString];
    [basicString appendString:totalStaring];
    NSLog(@"%@",basicString);
    return basicString;
}
/**根据商品优惠内容，补全商品信息*/
-(YLGoods*)completeMessageOfGoods:(YLGoods *)goods{
    YLFullReduce  *fullReduce=[[YLFullReduce alloc]init];
    YLNoDiscount *noDiscountKind=[[YLNoDiscount alloc]init];
    YLPercentDiscount *percentDiscount=[[YLPercentDiscount alloc]initWithPercent:0.05];
    if (goods.DiscountKind==NODISCOUNT) {
        goods.delegate=noDiscountKind;
        
    }else if (goods.DiscountKind==PERCENTDISCOUNT) {
        
        goods.delegate=percentDiscount;
        
    }else if (goods.DiscountKind==FULLREDUCE){
        
        goods.delegate=fullReduce;
       
    }
    
    return [goods.delegate discountWith:goods];
    
}
@end
