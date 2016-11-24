//
//  AFBEditAddressController.m
//  AFBMineAddress
//
//  Created by drfgh on 16/11/21.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBEditAddressController.h"
#import "AFBEditAddressCell.h"
#import "AFBEditAddressModel.h"
#import "AFBAddressController.h"
#import "AFBRemoveAddressCell.h"

static NSString *cellId = @"cell";
static NSString *removeCell = @"remove";
@interface AFBEditAddressController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *modelList;
@property (nonatomic,strong) NSDictionary *dic;
@end

@implementation AFBEditAddressController

- (NSMutableArray<AFBEditAddressModel *> *)modelList{
    
    if (_modelList == nil) {
        _modelList = [NSMutableArray array];
    }
    return _modelList;
}

- (NSDictionary *)dic{
    
    if (_dic == nil) {
        _dic = [[NSDictionary alloc]init];
    }
    return _dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"修改地址";
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = btn_right;
    
    NSDictionary *dic = @{@"name":@"小胖子高智佳",@"phone":@"1234567890",@"city":@"脑残市",@"area":@"智县镇二傻镇向阳屯",@"address":@"5438250号",@"name":@"临时顶位"};
    self.dic = dic;
    NSArray *detailsArr = @[@"小胖子高智佳",@"1234567890",@"脑残市",@"智县镇二傻镇向阳屯",@"5438250号",@"临时顶位"];
    for (int i = 0; i < detailsArr.count; i++) {
        AFBEditAddressModel *addressModel = [[AFBEditAddressModel alloc]init];
        //        addressModel.name = dic[@"key"];
        addressModel = detailsArr[i];
        [self.modelList addObject:addressModel];
    }
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    [tableView registerClass:[AFBEditAddressCell class] forCellReuseIdentifier:cellId];
    [tableView registerClass:[AFBRemoveAddressCell class] forCellReuseIdentifier:removeCell];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        AFBEditAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        tableView.rowHeight = 250;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1){
        AFBRemoveAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:removeCell forIndexPath:indexPath];
        tableView.rowHeight = 44;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}


- (void)save{
    NSLog(@"保存");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





























////
////  AFBEditAddressController.m
////  AFBMineAddress
////
////  Created by drfgh on 16/11/21.
////  Copyright © 2016年 drfgh. All rights reserved.
////
//
//#import "AFBEditAddressController.h"
//#import "AFBEditAddressCell.h"
//#import "AFBEditAddressModel.h"
//
//static NSString *cellId = @"cell";
//@interface AFBEditAddressController ()
//@property (nonatomic,strong) NSArray<AFBEditAddressModel *>*modelList;
//@end
//
//@implementation AFBEditAddressController
//
//- (void)setModelList:(NSArray<AFBEditAddressModel *> *)modelList{
//    
////    _modelList = modelList;
//    _modelList = @[@"name",@"gender",@"phone",@"city",@"area",@"address"];
//    
//    [self.tableView reloadData];
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.navigationItem.title = @"修改地址";
//    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(nextVc)];
//    self.navigationItem.rightBarButtonItem = btn_right;
//    
//    [self.tableView registerClass:[AFBEditAddressCell class] forCellReuseIdentifier:cellId];
//    
//     [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.leftBarButtonItem = self.editButtonItem;
////    self.navigationItem.leftBarButtonItem = 
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
////#warning Incomplete implementation, return the number of sections
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
////#warning Incomplete implementation, return the number of rows
//    return 6;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    AFBEditAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    
//    AFBEditAddressModel *model = self.modelList[indexPath.row];
//    
//    return cell;
//}
//
//- (void)nextVc{
//    
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
