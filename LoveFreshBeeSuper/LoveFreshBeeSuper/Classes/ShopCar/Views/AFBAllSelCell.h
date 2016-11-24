//
//  AFBAllSelCell.h
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFBAllSelCellDelegate <NSObject>

- (void)reloadTableViewData;

@end

@interface AFBAllSelCell : UITableViewCell

@property(nonatomic, weak) id <AFBAllSelCellDelegate> delegate;

@end
