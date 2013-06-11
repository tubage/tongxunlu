//
//  EZRootViewController.h
//  Tongxunlu
//
//  Created by kongkong on 13-6-11.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZNavigationBar.h"

typedef enum {
    PageTransitionHorizontal    = 1<<0,
    PageTransitionVertical      = 1<<1,
    None                        = 1<<2,
} PageTransitionType;

@class EZNavigationController;
@class EZTabbarController;
@interface EZRootViewController : UIViewController{
    EZNavigationBar*        _navigationBar;
}

@property(nonatomic,assign)CGRect                   defaultFrame;
@property(nonatomic,strong)EZNavigationController*  ezNavigationController;
@property(nonatomic,strong)EZTabbarController*      ezTabbarController;
@property(nonatomic,assign)BOOL                     showNavigationBar;
@property(nonatomic,assign)PageTransitionType       animationType;
@property(nonatomic, strong) UIPanGestureRecognizer    *panGestureRecognizer;
@property(nonatomic, strong) UISwipeGestureRecognizer  *swipeGestureRecognizer;

-(id)initWithDefaultFrame:(CGRect)frame;

-(void)setTitle:(NSString*)title;

-(void)setTitleView:(UIView*)titleView;

-(void)setLeftbarItem:(UIView*)leftBarItem;

-(void)setRightbarItem:(UIView*)rightBarItem;

@end
