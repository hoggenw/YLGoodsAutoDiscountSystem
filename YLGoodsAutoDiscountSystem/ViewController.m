//
//  ViewController.m
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import "ViewController.h"
#import "YLGoods.h"
#import "YLManageSystem.h"
#import "YLShowViewController.h"
@interface ViewController ()<UITextFieldDelegate>{
    NSMutableArray *goodsBaskat;
}
@property (weak, nonatomic) IBOutlet UILabel *firstGoods;
@property (weak, nonatomic) IBOutlet UILabel *secondGoods;
@property (weak, nonatomic) IBOutlet UILabel *thirdGoods;
@property (weak, nonatomic) IBOutlet UITextField *firstNumber;
@property (weak, nonatomic) IBOutlet UITextField *secondNumber;
@property (weak, nonatomic) IBOutlet UITextField *thirdNumber;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UISwitch *switch2;
@property (weak, nonatomic) IBOutlet UISwitch *switch3;
@property (weak, nonatomic) IBOutlet UISwitch *switch4;
@property (weak, nonatomic) IBOutlet UISwitch *switch5;
@property (weak, nonatomic) IBOutlet UISwitch *switch6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settextField];
    [self setSwitchALL];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**输入数量后点击确定按钮回调方法*/
- (IBAction)sureButtonAction:(id)sender {
    //模拟前端扫描
    if (!goodsBaskat) {
        goodsBaskat=[NSMutableArray array];
    }else{
        [goodsBaskat removeAllObjects];
    }
    if ([self judgeInputIfNull]) {
        
    }else{
        //根据扫描信息合成数据
        for (int i=200; i<203; i++) {
            UITextField *text=(id)[self.view viewWithTag:i];
            if ([text.text integerValue]!=0) {
                if ([text.text integerValue]!=1) {
                    NSString *needString=[NSString stringWithFormat:@"ITEM00%04d-%ld",(i-199),[text.text integerValue]];
                    [goodsBaskat addObject:needString];
                }else{
                    NSString *needString=[NSString stringWithFormat:@"ITEM00%04d",(i-199)];
                    [goodsBaskat addObject:needString];
                }
            }
        }
  
    //将扫描后的数据转换成json
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:goodsBaskat options:NSJSONWritingPrettyPrinted error:nil];
    //将数据输入打印小票模块
    YLManageSystem *system=[[YLManageSystem alloc]init];
    NSString  *putOutString=[system totalGoods:jsonData];
    //返回小票在终端显示
    NSLog(@"%@",putOutString);
    YLShowViewController *showVC=[[YLShowViewController alloc]init];
    showVC.showMessage=putOutString;
    [self presentViewController:showVC animated:YES completion:nil];
    }
}
//设置优惠,模拟后台设置
- (IBAction)setDiscount:(UISwitch *)sender {
    [self setDiscountBySwitchs];
}

//使文本框失去第一响应者
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (int i=200; i<203; i++) {
        UITextField *text=(id)[self.view viewWithTag:i];
        if ([text isFirstResponder]) {
            [text resignFirstResponder];
            
            break;
        }
    }
    
}
//点击键盘完成回调方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isFirstResponder]) {
        [textField resignFirstResponder];  // 取消第一响应者
        
    }
    
    return YES;
}
//定制textField
-(void)settextField{
    _firstNumber.delegate=self;
    _secondNumber.delegate=self;
    _thirdNumber.delegate=self;
    _firstNumber.returnKeyType=UIReturnKeyDone;
    _secondNumber.returnKeyType=UIReturnKeyDone;
    _thirdNumber.returnKeyType=UIReturnKeyDone;
    
    
}
/**
 *  限制输入数字并且不能大于10000
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(range.length==1){
        return YES;
    }else{
    //调用正则表达式判断
    if(textField.text.length>3){
        return NO;
    }else if([textField.text isEqualToString:@"0"]){
        return NO;
    }
    }
    return [self validateNumberByRegExp:string];
}
//判断输入字符是否是数字
- (BOOL)validateNumberByRegExp:(NSString *)string {
    BOOL isValid = NO;
    NSUInteger len = string.length;
    
    if (len > 0&&len<=4) {
        NSString *regex=@"[0-9]";
        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        isValid = [predicate evaluateWithObject:string];
    }
    
    return isValid;
}
//判断输入是否都为0或者为空
-(BOOL)judgeInputIfNull{
    
    UITextField *text1=(id)[self.view viewWithTag:200];
    UITextField *text2=(id)[self.view viewWithTag:201];
    UITextField *text3=(id)[self.view viewWithTag:202];
    if (([text1.text isEqualToString:@""]||[text1.text isEqualToString:@"0"])&&([text2.text isEqualToString:@""]||[text2.text isEqualToString:@"0"])&&([text3.text isEqualToString:@""]||[text3.text isEqualToString:@"0"])) {
        return YES;
    }
    return NO;
}
//设置switch按钮默认属性
-(void)setSwitchALL{
    [_switch1 setOn:NO];
    [_switch2 setOn:NO];
    [_switch3 setOn:YES];
    [_switch4 setOn:NO];
    [_switch5 setOn:NO];
    [_switch6 setOn:YES];
}
/**控件变化对应优惠设置,实际中可以存入数据库，除了使用NSUserDefaults，使用苹果自带的Sqlite也可以达到目的*/
-(void)setDiscountBySwitchs{
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    NSDictionary *Dict1=[NSDictionary dictionary];
    NSDictionary *Dict2=[NSDictionary dictionary];
    NSDictionary *Dict3=[NSDictionary dictionary];
    if (_switch2.on) {
     Dict1=@{@"ITEM000001":@[@"苹果",@(FULLREDUCE),@(5),@"斤"]};
        
    }else if (_switch1.on &&!_switch2.on){
    Dict1=@{@"ITEM000001":@[@"苹果",@(PERCENTDISCOUNT),@(5),@"斤"]};
    }else if (!_switch1.on&&!_switch2.on){
         Dict1=@{@"ITEM000001":@[@"苹果",@(NODISCOUNT),@(5),@"斤"]};
    }
    if (_switch4.on) {
      Dict2=@{@"ITEM000002":@[@"羽毛球",@(FULLREDUCE),@(1),@"个"]};
        
    }else if (_switch3.on &&!_switch4.on){
       Dict2=@{@"ITEM000002":@[@"羽毛球",@(PERCENTDISCOUNT),@(1),@"个"]};
    }else if (!_switch3.on&&!_switch4.on){
        Dict2=@{@"ITEM000002":@[@"羽毛球",@(NODISCOUNT),@(1),@"个"]};
    }
    if (_switch6.on) {
       Dict3=@{@"ITEM000003":@[@"篮球",@(FULLREDUCE),@(88),@"个"]};
        
    }else if (_switch5.on &&!_switch6.on){
       Dict3=@{@"ITEM000003":@[@"篮球",@(PERCENTDISCOUNT),@(88),@"个"]};
    }else if (!_switch5.on&&!_switch6.on){
       Dict3=@{@"ITEM000003":@[@"篮球",@(NODISCOUNT),@(88),@"个"]};
    }
    NSArray *array=@[Dict1,Dict2,Dict3];
    [userDef setObject:array forKey:@"DISCOUNT"];
    [userDef synchronize];
}
@end















