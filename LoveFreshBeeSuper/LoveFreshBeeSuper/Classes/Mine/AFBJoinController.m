//
//  AFBJoinController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/24.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBJoinController.h"

@interface AFBJoinController ()

@end

@implementation AFBJoinController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI
{
    UIScrollView *scoreView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scoreView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scoreView];
    scoreView.contentSize = CGSizeMake(kScreenWidth, 1000);
    
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [scoreView addSubview:topView];
    
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    imageview.image = [UIImage imageNamed:@"join"];
    [topView addSubview:imageview];


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
