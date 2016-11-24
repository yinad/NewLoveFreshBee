//
//  AFBShopCarController.m
//  LoveFreshBee
//
//  Created by Adam on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBShopCarController.h"
#import "AFBHomeController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "AFBShopCarFisrtCell.h"
#import "AFBShopCarSupermarkerCell.h"
#import "AFBAdressTimeCell.h"
#import "AFBCouDanCell.h"
#import "AFBBusinessListCell.h"
#import "AFBCommentCell.h"
#import "AFBAllSelCell.h"
#import "AFBCommentController.h"
#import "AFBShopCarGoodsCell.h"
#import "UITabBar+AFBBage.h"
#import "AFBOrderGoodsDetailController.h"

@class AFBCommonGoodsModel;
static NSString *FirstID = @"fis_id";
static NSString *shopMakID = @"shopMak_id";
static NSString *AdressID = @"adr_id";
static NSString *buyCardID = @"buy_id";
static NSString *BusiListID = @"business_id";
static NSString *CommentID = @"comment_id";
static NSString *AllselID = @"allSelID";
static NSString *GoodsCell = @"goodsCell";


@interface AFBShopCarController ()<UITableViewDelegate,UITableViewDataSource,AFBShopCarGoodscellDelegate,AFBShopCarGoodscellDelegate>

@property(nonatomic,strong) UITableView *shopCarView;
@property(nonatomic,strong) NSArray<AFBCommonGoodsModel*> *shopModelList;
@property(nonatomic, weak) UIView * bgView;


@end

@implementation AFBShopCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取通知
    NSNotificationCenter *cationCenter = [NSNotificationCenter defaultCenter];
    //参数1:监听者
    //参数2:监听的方法
    //参数3:监听谁 (哪个通知)
    //参数4:nil
    [cationCenter addObserver:self selector:@selector(addBuyCarViewData:) name:@"reloadData" object:nil];
    NSLog(@"接收通知");
}
- (void)addBuyCarViewData:(NSNotification *)no{
    [self.shopCarView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self addBgView];
}
- (void)setupUI{
    //    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    [self addTableView];
}

//添加tableView
- (void)addTableView{
    
    //这里要判断是否有数据,进入这个页面的时候
    NSLog(@"%zd",ShopCar.goodsList.count);
    //    if (self.shopModelList.count) {
    self.shopCarView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_shopCarView];
    
    _shopCarView.delegate = self;
    _shopCarView.dataSource = self;
    
    //注册
    [_shopCarView registerNib:[UINib nibWithNibName:@"AFBShopCarFisrtCell" bundle:nil] forCellReuseIdentifier:FirstID];
    [_shopCarView registerNib:[UINib nibWithNibName:@"AFBShopCarSupermarkerCell" bundle:nil] forCellReuseIdentifier:shopMakID];
    [_shopCarView registerNib:[UINib nibWithNibName:@"AFBAdressTimeCell" bundle:nil] forCellReuseIdentifier:AdressID];
    [_shopCarView registerNib:[UINib nibWithNibName:@"AFBCouDanCell" bundle:nil] forCellReuseIdentifier:buyCardID];
    [_shopCarView registerClass:[AFBBusinessListCell class] forCellReuseIdentifier:BusiListID];
    [_shopCarView registerClass:[AFBCommentCell class] forCellReuseIdentifier:CommentID];
    [_shopCarView registerClass:[AFBAllSelCell class] forCellReuseIdentifier:AllselID];
    [_shopCarView registerNib:[UINib nibWithNibName:@"AFBShopCarGoodsCell" bundle:nil] forCellReuseIdentifier:GoodsCell];
    //    }else{
    //        [self.shopCarView removeFromSuperview];
    //    }
    //
}

- (void)addBgView{
    self.shopModelList = ShopCar.goodsList;
    if (!self.shopModelList.count){
        //防止重复创建多个遮罩View
        if (_bgView) {
            return;
        }
        UIView * bgView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        bgView.backgroundColor = [UIColor whiteColor];
        _bgView = bgView;
        [self.view addSubview:_bgView];
        
        UIImageView *shopView = [[UIImageView alloc] init];
        shopView.image = [UIImage imageNamed:@"v2_shop_empty"];
        [_bgView addSubview:shopView];
        //    shopView.center = bgView.center;
        
        UILabel *desLabel = [[UILabel alloc] init];
        desLabel.text = @"亲,购物车空空的耶~赶紧去挑好吃的吧";
        desLabel.font = [UIFont systemFontOfSize:14];
        desLabel.textColor = [UIColor grayColor];
        desLabel.textAlignment = NSTextAlignmentCenter;
        [_bgView addSubview:desLabel];
        
        UIButton *searchBtn = [[UIButton alloc] init];
        [searchBtn setTitle:@"去逛逛" forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [searchBtn.layer setBorderWidth:0.5];
        [searchBtn addTarget:self action:@selector(jumpToHomeVc) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:searchBtn];
        //布局
        [shopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_bgView);
            make.centerY.equalTo(_bgView).offset(-80);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.centerX.equalTo(_bgView);
            
        }];
        [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_bgView);
            make.centerY.equalTo(_bgView).offset(40);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(40);
        }];
    }else{
        [_bgView removeFromSuperview];
        [self.shopCarView reloadData];
    }
}

- (void)jumpToHomeVc{
    [self.tabBarController setSelectedIndex:0];
    NSLog(@"jumpToHomeVc");
}

//MARK:cell的代理方法:删除当前行
- (void)removeCellForTableView:(AFBCommonGoodsModel *)model{
    //2数据
//    UIAlertView *alerView =  [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定删除这个商品吗？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//    [alerView show];
    [self.shopCarView reloadData];
}

//MARK:点击加和减号的动画效果
- (void)reduceGoodsForTableView{
    AFBShopCart *shopCar = [AFBShopCart sharedShopCart];
    
    [self.tabBarController.tabBar showBadgeOnItemIndex:2 withBadge:[NSString stringWithFormat:@"%zd",[shopCar showGoodsListCount]]];
    if ([shopCar showGoodsListCount] == 0) {
        [self.tabBarController.tabBar hideBadgeOnItemIndex:2];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

//MARK:行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 3 ;
    }
    else if (section == 2){
        return self.shopModelList.count;
    }
    return 2;
    
}

//MARK:Cell的返回
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //创建第一种cell
        AFBShopCarFisrtCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0) {
        //创建第二种cell 闪送超市
        AFBShopCarSupermarkerCell *cell = [tableView dequeueReusableCellWithIdentifier:shopMakID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 1) {
        //创建第三种cell 收货时间
        AFBAdressTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:AdressID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 2){
        AFBCouDanCell *cell = [tableView dequeueReusableCellWithIdentifier:buyCardID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.section == 2){
        // 商品列表
        AFBShopCarGoodsCell * cell = [tableView dequeueReusableCellWithIdentifier:GoodsCell forIndexPath:indexPath];
        if (self.shopModelList.count) {
            cell.model = self.shopModelList[indexPath.row];
            cell.tableView = self.shopCarView;
            cell.delegate = self;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    
    else if (indexPath.section == 3 && indexPath.row == 0){
        AFBCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CommentID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    else if (indexPath.section == 3 && indexPath.row == 1){
        AFBAllSelCell *cell = [tableView dequeueReusableCellWithIdentifier:AllselID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}
//设置组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 ||section == 1) {
        return 10.0;
    }
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    else if(indexPath.section == 1 && indexPath.row == 0){
        return 39;
    }
    else if((indexPath.section == 1 && indexPath.row == 1) || (indexPath.section == 1 && indexPath.row == 2)) {
        return 74;
    }
    else if(indexPath.section == 2){
        return 80;
    }
    return 60;
}
//MARK:cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
//        NSLog(@"点击了第一个cell");
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
//        NSLog(@"点击了闪送超时");
    }
    else if(indexPath.section == 1 && indexPath.row == 2){
        NSLog(@"点击凑单专区");
    }
    else if(indexPath.section == 2){
        NSLog(@"点击了商品列表");
        AFBOrderGoodsDetailController *goodsDetailVC = [[AFBOrderGoodsDetailController alloc] init];
        goodsDetailVC.model = self.shopModelList[indexPath.row];
        [self.navigationController pushViewController:goodsDetailVC animated:YES];
    }
    else if(indexPath.section == 3 && indexPath.row == 0){
        NSLog(@"点击了备注");
        AFBCommentController *comVc = [[AFBCommentController alloc] init];
        
        
        //        comVc.myBlock = ^(NSString *str)
        //        {
        //            NSLog(@"%@",str);
        //        };
        [self.navigationController pushViewController:comVc animated:YES];
        [self.navigationController hidesBottomBarWhenPushed];
        
    }
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
