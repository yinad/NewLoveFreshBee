//
//  AFBOrderRightCell.h
//  LoveFreshBee
//
//  Created by Colbert Zhan on 2016/11/19.
//  Copyright © 2016年 gao2015. All rights reserved.
//
#import "AFBOrderIncreaseAndReduceView.h"
#import <UIKit/UIKit.h>
@class AFBCommonGoodsModel;
@class AFBOrderRightCell;

@protocol AFBOrderRightCellDelegate <NSObject>

- (void)homeThreeCell:(UIImageView *)OrderRightImageView withModel:(AFBCommonGoodsModel *)Model withStartPoint:(CGPoint)startp;

@end

@interface AFBOrderRightCell : UITableViewCell

@property(nonatomic, strong) AFBCommonGoodsModel * dataModel;

@property(nonatomic, weak) id <AFBOrderRightCellDelegate> delegate;

@property(nonatomic,assign)CGPoint startP;

@end
