//
//  AFBShopCarGoodsCell.h
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/24.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFBShopCarGoodsCell;
@protocol AFBShopCarGoodscellDelegate <NSObject>

- (void)removeCellForTableView:(AFBCommonGoodsModel *)model;

- (void)reduceGoodsForTableView;

@end

@class AFBCommonGoodsModel;
@interface AFBShopCarGoodsCell : UITableViewCell

@property(nonatomic, weak) id <AFBShopCarGoodscellDelegate> delegate;
@property(nonatomic, strong) AFBCommonGoodsModel * model;
@property(nonatomic,weak)UITableView *tableView;
@end
