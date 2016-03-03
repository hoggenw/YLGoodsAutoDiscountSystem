//
//  YLShowViewController.m
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/3.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import "YLShowViewController.h"

@interface YLShowViewController ()
@property (weak, nonatomic) IBOutlet UITextView *showTextView;

@end

@implementation YLShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _showTextView.text=_showMessage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
