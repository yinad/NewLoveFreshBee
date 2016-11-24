//
//  AFBNewAddressController.m
//  LoveFreshBeeSuper
//
//  Created by drfgh on 16/11/24.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBNewAddressController.h"
#import "AFBNewAddressCell.h"

static NSString *cellID = @"cell";
@interface AFBNewAddressController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AFBNewAddressController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"添加地址";

    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    [tableView registerClass:[AFBNewAddressCell class] forCellReuseIdentifier:cellID];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];

    [self setupUI];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AFBNewAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    tableView.rowHeight = 250;
    return cell;
}
- (void)setupUI{
    
    
    
    
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
