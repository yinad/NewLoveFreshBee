//
//  AFBHelpAfterSaleController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/24.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBHelpAfterSaleController.h"
#import "AFBHolderView.h"
@interface AFBHelpAfterSaleController ()

@end

@implementation AFBHelpAfterSaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"退款/售后";
    
    [self setupUI];
    
}
- (void)setupUI
{

    AFBHolderView *backView = [AFBHolderView creatHolderViewWithImageName:@"v2_order_empty" lbName:@"你还没有相关订单呦~"];
    CGFloat imgHW = 160;
    backView.frame = CGRectMake((kScreenWidth - imgHW)/2, (kScreenHeight - imgHW)/2, imgHW, imgHW);
    [self.view addSubview:backView];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
