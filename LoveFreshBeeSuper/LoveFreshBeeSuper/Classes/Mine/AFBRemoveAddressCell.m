//
//  AFBRemoveAddressCell.m
//  AFBMineAddress
//
//  Created by drfgh on 16/11/23.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBRemoveAddressCell.h"
#import "AFBEditAddressController.h"
#import "Masonry.h"

@implementation AFBRemoveAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UIButton *btn_remove = [[UIButton alloc]init];
    [btn_remove setTitle:@"删除当前地址" forState:UIControlStateNormal];
    [btn_remove setTitle:@"删除当前地址" forState:UIControlStateSelected];
    [btn_remove setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_remove addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:btn_remove];
    
    [btn_remove mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView);
        make.top.bottom.left.right.equalTo(self.contentView);
    }];
    
}

- (void)push{
    NSLog(@"push");
    
//    AFBEditAddressController *eaVc = [[AFBEditAddressController alloc]init];
//    [self.navigationController pushViewController:eaVc animated:YES];
//    
//    [self removeFromSuperview];
    
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
