//
//  AFBAnimatonManager.m
//  LoveFreshBeeSuper
//
//  Created by Kevin on 2016/11/24.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBAnimatonManager.h"
#import "AFBHomeCollectionController.h"

@interface AFBAnimatonManager()<CAAnimationDelegate>

@end

@implementation AFBAnimatonManager

- (void)startAnimationWithStartPoint:(CGPoint)startP imageView:(UIImageView *)imageView size:(CGRect)size{
    UIImage *ima = imageView.image;
    UIImageView *imaV = [[UIImageView alloc]initWithImage:ima];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:imaV];
    imaV.center = startP;
    imaV.bounds = size;
    
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *basicScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CABasicAnimation *basicOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //keyAnimation
    CGFloat wigth = [UIScreen mainScreen].bounds.size.width/8;
    CGFloat endX = wigth*5;
    [path moveToPoint:startP];
    CGPoint controlP = CGPointMake(startP.x, startP.y-200);
    CGPoint endP = CGPointMake(endX, [UIScreen mainScreen].bounds.size.height-40);
    [path addQuadCurveToPoint:endP controlPoint:controlP];
    key.path = path.CGPath;
    key.duration = 1;
    [key setValue:imaV forKey:@"key"];
    key.removedOnCompletion = NO;
    key.fillMode = kCAFillModeForwards;
    
    //basicScale
    basicScale.fromValue = @(1);
    basicScale.toValue = @(0.1);
    basicScale.duration = 1;
    basicScale.removedOnCompletion = NO;
    basicScale.fillMode = kCAFillModeForwards;
    
    //basicOpacity
    basicOpacity.duration = 1;
    basicOpacity.fromValue = @(1);
    basicOpacity.toValue = @(0.5);
    basicOpacity.removedOnCompletion = NO;
    basicOpacity.fillMode = kCAFillModeForwards;
    
    //添加动画
    key.delegate = self;
    [imaV.layer addAnimation:key forKey:@"keyAmimation"];
    [imaV.layer addAnimation:basicScale forKey:@"basicScale"];
    [imaV.layer addAnimation:basicOpacity forKey:@"basicOpacity"];
}

//结束动画后操作
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    UIImageView *imaV = [anim valueForKey:@"key"];
    [imaV removeFromSuperview];
}
@end
