//
//  UserMessageController.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "UserMessageController.h"
#import "AFBHolderView.h"


static NSString *twoCellID = @"twoCell";



@interface UserMessageController ()

@property (nonatomic, strong) UIView *holderView;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation UserMessageController
/**
 *  懒加载
 */
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 600;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self setupAFBHolderView];
}


- (void)setupAFBHolderView {
    self.holderView = [AFBHolderView creatHolderViewWithImageName:@"pushlistview_up" lbName:@"没有消息呦"];
    
    _holderView.frame = CGRectMake(100, 230, 150, 80);
    [self.tableView addSubview:_holderView];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
    return cell;
}


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
