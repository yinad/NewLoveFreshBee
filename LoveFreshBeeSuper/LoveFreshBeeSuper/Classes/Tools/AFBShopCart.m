//
//  AFBSharedBuyCar.m
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/23.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBShopCart.h"
#import "AFBCommonGoodsModel.h"

static AFBShopCart *_sharedShopCart = nil;

@implementation AFBShopCart

//MARK:判断购物车中是否有模型
- (BOOL)isContainModel:(AFBCommonGoodsModel *)model{
    __block BOOL isContain = NO;
    [_sharedShopCart.goodsList enumerateObjectsUsingBlock:^(AFBCommonGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.rangeID integerValue]==[model.rangeID integerValue]) {
            isContain = YES;
        }
    }];
    return isContain;
}

//对比返回Model
- (AFBCommonGoodsModel *)returnModel:(AFBCommonGoodsModel *)model{
    for (AFBCommonGoodsModel * obj in _sharedShopCart.goodsList) {
        if ([obj.rangeID integerValue] == [model.rangeID integerValue]) {
            return obj;
        }
    }
    return model;
}

//MARK:添加一个model到购物车
- (void)shopCartAddGoodsModel:(AFBCommonGoodsModel *)model{
    if ([_sharedShopCart isContainModel:model]) {
        //返回对应的model,确保操作的是购物车数组里的模型而不是新传入的模型
        AFBCommonGoodsModel* tempModel = [_sharedShopCart returnModel:model];
        tempModel.buyCount++;

    }else{
        [_sharedShopCart.goodsList addObject:model];
        model.buyCount = 1;
        NSLog(@"新添加了一个新商品");
    }
}

//MARK:减少一个model
- (void)shopCartSubGoodsModel:(AFBCommonGoodsModel *)model{
    //判断是否包含model
    if ([_sharedShopCart isContainModel:model]) {
        //返回对应的model,确保操作的是购物车数组里的模型而不是新传入的模型
            AFBCommonGoodsModel* tempModel = [_sharedShopCart returnModel:model];
            tempModel.buyCount--;
            if (tempModel.buyCount == 0) {
                 [_sharedShopCart.goodsList removeObject:tempModel];
                NSLog(@"购物车里已经没有了这个商品");
            }
        
//        NSLog(@"%zd,%f",[_sharedShopCart showGoodsListCount],[_sharedShopCart showGoodsListPrice]);
    }
}

//MARK:购物车中的商品总价
//- (CGFloat)showGoodsListPrice{
//    __block CGFloat price = 0.0;
//    [_sharedShopCart.goodsList enumerateObjectsUsingBlock:^(AFBCommonGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        price = obj.partner_price+;
//    }];
//    return price;
//}

//MARK:购物车中的商品数量
- (NSInteger)showGoodsListCount{
    __block NSInteger listCount = 0;
    [_sharedShopCart.goodsList enumerateObjectsUsingBlock:^(AFBCommonGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        listCount = obj.buyCount ++;
    }];
    
    return listCount;
}

//MARK:购物车的单例获取方法
+ (instancetype)sharedShopCart {
    
    static dispatch_once_t  token;
    dispatch_once(&token, ^{
        if (_sharedShopCart == nil ) {
            _sharedShopCart = [[AFBShopCart alloc] init];
        }
    });
    return _sharedShopCart;
}

- (NSMutableArray *)goodsList {
    if (_goodsList==nil) {
        _goodsList = [[NSMutableArray alloc] init];
    }
    return _goodsList;
}

- (NSInteger)count {
    return self.goodsList.count;
}


@end
