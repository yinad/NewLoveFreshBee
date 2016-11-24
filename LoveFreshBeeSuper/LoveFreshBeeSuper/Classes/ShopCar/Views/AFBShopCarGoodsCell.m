//
//  AFBShopCarGoodsCell.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/24.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBShopCarGoodsCell.h"
#import <UIImageView+WebCache.h>
#import "AFBCommonGoodsModel.h"
#import "AFBOrderIncreaseAndReduceView.h"

@interface AFBShopCarGoodsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *hotLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;



@end

@implementation AFBShopCarGoodsCell

- (void)setModel:(AFBCommonGoodsModel *)model{
    _model = model;

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeSelecked:) name:@"allSel" object:nil];
    
    self.selectBtn.selected = model.isSelcet;
    self.buyCountLabel.text = @(model.buyCount).description;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLabel.text = model.name;
    CGFloat partner_price = [model.partner_price floatValue];
    self.price.text = [NSString stringWithFormat:@"¥%0.2f",partner_price];
    
    [self.hotLabel.layer setBorderWidth:0.8];
    self.hotLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.hotLabel.textColor = [UIColor redColor];
    self.hotLabel.layer.cornerRadius = 5;
}

- (void)changeSelecked:(NSNotification *)notification{
    UIButton *sender = [notification object];
//     = dic[@"sender"];
    self.model.isSelcet = sender.selected;
    self.selectBtn.selected = sender.selected;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
- (IBAction)clickPlusBtn:(id)sender {
    _ShopCarAdd(self.model);
    if (self.model.buyCount > 99) {
        self.buyCountLabel.text = @"99+";
        return;
    }
  
    [self.delegate returnAllPrice];
    [self.delegate reduceGoodsForTableView];
    self.buyCountLabel.text = @(self.model.buyCount).description;
//    [self notificationCenter];
}

- (IBAction)clickSubBtn:(id)sender {
    _ShopCarSub(self.model);
    if (self.model.buyCount == 0) {
        NSLog(@"删除商品");
        [self.delegate removeCellForTableView:self.model];
    }
    [self.delegate returnAllPrice];
    [self.delegate reduceGoodsForTableView];
    self.buyCountLabel.text = @(self.model.buyCount).description;

}



- (IBAction)selectBtn:(id)sender {
    self.model.isSelcet = !self.model.isSelcet;
    self.selectBtn.selected = !self.selectBtn.selected;
    
    if (self.model.isSelcet) {
        NSLog(@"选中了该商品");
    }else{
        NSLog(@"取消了该商品的选择");
    }
    
    [self.delegate seleckBtnChange:self];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
