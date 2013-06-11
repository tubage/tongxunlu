//
//  CallViewController.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "CallViewController.h"

@interface CallViewController (){
    UIView*     _keyBoard;
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
        _keyBoard = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height, self.view.width, 250)];
        UIImageView* bg = [[UIImageView alloc]initWithFrame:_keyBoard.bounds];
        bg.image = [[UIImage imageNamed:@"KeyboardBgNormal"]stretchableImageWithLeftCapWidth:5 topCapHeight:20];
        
        [_keyBoard addSubview:bg];
    }
    
    if (_keyBoard.superview != self.view) {
        [self.view addSubview:_keyBoard];
    }
}

-(void)showKeyBoard{
    if (!_keyBoard) {
        [self loadKeyBoard];
    }
    
    [UIView animateWithDuration:EZ_ANIMATION_DURATION animations:^{
        _keyBoard.bottom = self.view.height;
        
        UIScrollView* scollView = (UIScrollView*)self.view;
        
        scollView.contentOffset = CGPointMake(0,_navigationBar.height);
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
    }];
    
}

@end
