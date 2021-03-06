//
//  CallViewController.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "CallViewController.h"
#import "TXLKeyBoard.h"

@interface CallViewController (){
    TXLKeyBoard*     _keyBoard;
    UIControl*       _maskView;
}

-(void)loadKeyBoard;
@end

@implementation CallViewController

-(id)initWithDefaultFrame:(CGRect)frame{
    self = [super initWithDefaultFrame:frame];
    
    if (self) {
        self.showNavigationBar = YES;
        self.callViewState = CallViewHide;
    }
    return self;
}

-(void)loadView{
    self.view = [[UIScrollView alloc]initWithFrame:self.defaultFrame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_call"]];
    
    [self setTitle:@"最近联系人"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark
#pragma -mark keyBoard method
-(void)loadKeyBoard{
    if (!_keyBoard) {
        _keyBoard = [[TXLKeyBoard alloc]initWithPosition:CGPointMake(0, self.view.height)];
    }
    
    if (_keyBoard.superview != self.view) {
        [self.view addSubview:_keyBoard];
    }
}

-(void)showKeyBoard{
    if (!_keyBoard) {
        [self loadKeyBoard];
    }
    
    if (!_maskView) {
        _maskView = [[UIControl alloc]initWithFrame:self.view.bounds];
        [_maskView addTarget:self action:@selector(willHide) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [UIView animateWithDuration:EZ_ANIMATION_DURATION animations:^{
        _keyBoard.bottom = self.view.height;
        
        UIScrollView* scollView = (UIScrollView*)self.view;
        
        scollView.contentOffset = CGPointMake(0,_navigationBar.height);
    } completion:^(BOOL finished) {
        if (_maskView.superview != self.view) {
            [self.view addSubview:_maskView];
        }
        [self.view bringSubviewToFront:_keyBoard];
        self.callViewState = CallViewShow;
    }];
}

-(void)hideKeyBoard{
    if (!_keyBoard) {
        [self loadKeyBoard];
    }
    
    [UIView animateWithDuration:EZ_ANIMATION_DURATION animations:^{
        _keyBoard.top = self.view.height;
        
        UIScrollView* scollView = (UIScrollView*)self.view;
        
        scollView.contentOffset = CGPointMake(0,0);
    } completion:^(BOOL finished) {
        [_maskView removeFromSuperview];
        self.callViewState = CallViewHide;
    }];
}

-(void)willHide{
    if ([self.delegate respondsToSelector:@selector(callViewControllerWillHideKeyBoard)]) {
        [self.delegate callViewControllerWillHideKeyBoard];
    }
    
    [self hideKeyBoard];
}

@end
