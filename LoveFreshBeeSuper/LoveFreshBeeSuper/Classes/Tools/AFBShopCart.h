//
//  AFBSharedBuyCar.h
//  LoveFreshBeeSuper
//
//  Created by Adam on 2016/11/23.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import <Foundation/Foundation.h>
//添加
#define _ShopCarAdd(M) [[AFBShopCart sharedShopCart] shopCartAddGoodsModel: M]
//减少
#define _ShopCarSub(M) [[AFBShopCart sharedShopCart] shopCartSubGoodsModel: M]
//判断
#define _ShopCarHas(M) [[AFBShopCart sharedShopCart] returnModel:M]
//购物车中的商品个数总和
#define _ShopCarGoodsCound [[AFBShopCart sharedShopCart] showGoodsListCount]
//商品总价
#define _ShopCarGoodsPrice [[AFBShopCart sharedShopCart] showGoodsListPrice]

#define ShopCar [AFBShopCart sharedShopCart]

@class AFBCommonGoodsModel;

@interface AFBShopCart : NSObject

@property (nonatomic, strong) NSMutableArray<AFBCommonGoodsModel *> * goodsList;//商品清单

@property (nonatomic,readonly) NSInteger count; //////购物车中商品的数量

+ (instancetype)sharedShopCart;

//- (void)shopCartShowGoodsList;

//购物车的回调
- (void)shopCartAddGoodsModel:(AFBCommonGoodsModel *)model;

- (void)shopCartSubGoodsModel:(AFBCommonGoodsModel *)model;

- (AFBCommonGoodsModel *)returnModel:(AFBCommonGoodsModel *)model;

- (NSInteger)showGoodsListCount;

- (CGFloat)showGoodsListPrice;

@end
