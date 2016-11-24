//
//  AFBOrderGoodsDetailsFootView.m
//  LoveFreshBeeSuper
//
//  Created by Colbert Zhan on 2016/11/22.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBOrderGoodsDetailsFootView.h"

@implementation AFBOrderGoodsDetailsFootView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}



- (void)setupUI{
    
    self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
    self.backgroundColor = [UIColor whiteColor];
    
    //收藏按钮
    UIButton *favoriteBtn = [[UIButton alloc] init];
    [favoriteBtn setAttributedTitle:[NSAttributedString ay_imageTextWithImage:[UIImage imageNamed:@"non_collection"] imageW:15 imageH:15 title:@"收藏" fontSize:11 titleColor:[UIColor blackColor] spacing:2] forState:UIControlStateNormal];
    favoriteBtn.titleLabel.numberOfLines = 0;
    favoriteBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.favoriteBtn = favoriteBtn;
    [self addSubview:favoriteBtn];
    UILabel *addDoodsLab = [UILabel ay_labelWithText:@"添加商品：" color:[UIColor blackColor] font:14];
    [self addSubview:addDoodsLab];
    
    //添加减少商品的view
    AFBOrderIncreaseAndReduceView * increaseAndReduceView = [AFBOrderIncreaseAndReduceView orderIncreaseAndReduceView];
    self.increaseAndReduceView = increaseAndReduceView;
    [self addSubview:increaseAndReduceView];
    increaseAndReduceView.delegate = self;
    
    //购物车按钮
    UIButton *shopCarBtn = [[UIButton alloc] init];
    [shopCarBtn setImage:[UIImage imageNamed:@"v2_shop_empty"] forState:UIControlStateNormal];
    [self addSubview:shopCarBtn];
    
    //购物车右上角的商品数量
    UILabel *goodsCountLab = [[UILabel alloc] init];
    goodsCountLab.layer.cornerRadius = 7;
    goodsCountLab.layer.masksToBounds = YES;
    goodsCountLab.backgroundColor = [UIColor redColor];
    goodsCountLab.textColor = [UIColor whiteColor];
    goodsCountLab.font = [UIFont boldSystemFontOfSize:11];
    goodsCountLab.textAlignment = UITextAlignmentCenter;
    goodsCountLab.text = @(self.model.buyCount).description;
    
    self.goodsCountLab = goodsCountLab;
    goodsCountLab.hidden = YES;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        goodsCountLab.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    [self addSubview:goodsCountLab];
    
    //布局
    [favoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.centerY.equalTo(self);
    }];
    
    [addDoodsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(favoriteBtn);
        make.left.equalTo(favoriteBtn.mas_right).offset(24);
    }];
    
    [increaseAndReduceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addDoodsLab);
        make.left.equalTo(addDoodsLab.mas_right).offset(4);
        make.width.mas_equalTo(increaseAndReduceView.width);
    }];
    
    [shopCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(-10);
        make.right.equalTo(self).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [goodsCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shopCarBtn);
        make.left.equalTo(shopCarBtn.mas_centerX).offset(10);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
}

//- (void)setGoodsCount:(NSInteger)goodsCount{
//    _goodsCount = goodsCount;
//    
//    //如果个数为0 隐藏 减号 和 数量Label
//    _goodsCountLab.hidden = (goodsCount == 0);
//    
//    //给label赋值
//    _goodsCountLab.text = @(goodsCount).description;
//    
//}
//


//实现加减View的代理方法
- (void)minusPlusView:(AFBOrderIncreaseAndReduceView *)iarView withCount:(NSInteger)goodsCount{
    
    _goodsCount = goodsCount;
    _goodsCountLab.text = @(iarView.model.buyCount).description;
    self.goodsCountLab.hidden = (self.goodsCount == 0);
    
}

- (void)setModel:(AFBCommonGoodsModel *)model{
    _model = model;
    if (model.buyCount != 0) {
        self.goodsCountLab.text = @(model.buyCount).description;
        self.goodsCountLab.hidden = NO;
    }
}


@end
