//
//  TXLKeyBoard.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "TXLKeyBoard.h"
#import "UIButton+EZ.h"

@implementation TXLKeyBoard

-(id)initWithPosition:(CGPoint)position{
    self = [super initWithFrame:CGRectMake(position.x, position.y, FULL_WIDTH, 250)];
    if (self) {
        [self loadBg];
        [self loadKeys];
    }
    
    return self;
}

-(void)loadBg{
    UIImageView* bg = [[UIImageView alloc]initWithFrame:self.bounds];
    bg.image = [[UIImage imageNamed:@"KeyboardBgNormal"]stretchableImageWithLeftCapWidth:5 topCapHeight:20];
    bg.tag = -1;
    
    [self addSubview:bg];
}

-(void)loadKeys{
    CGFloat xOfffset = 0.0f ,yOffset = 50.0f;
    
    UIImage* bg = [[UIImage imageNamed:@"KeyboardBgNormal"]stretchableImageWithLeftCapWidth:5 topCapHeight:20];
    
    UIImage* focus = [[UIImage imageNamed:@"KeyboardBgPress"]stretchableImageWithLeftCapWidth:5 topCapHeight:20];
    
    for (short index = 0; index < 9; index ++) {
        
        NSString* keyImage = [NSString stringWithFormat:@"DialNumber%d",49+index];
        
        UIButton* key = [UIButton buttonWithImage:[UIImage imageNamed:keyImage] backgroundImage:bg highlightedBackgroundImage:focus target:self action:@selector(keyPressAction:)];
        
        key.frame = CGRectMake(xOfffset, yOffset, 106+((index+1)%3?0:1), 50);
        
        if (0 != index && 0 == (index+1)%3) {
            xOfffset = 0;
            yOffset += 50;
        }
        else{
            xOfffset += 106;
        }
        [self addSubview:key];
        
        key.tag = 49+index;
    }
    
    UIButton* star = [UIButton buttonWithImage:[UIImage imageNamed:@"DialNumber42_53"] backgroundImage:bg highlightedBackgroundImage:focus target:self action:@selector(keyPressAction:)];
    star.frame = CGRectMake(xOfffset , yOffset, 106, 50);
    [self addSubview:star];
    star.tag = 42+53;
    
    xOfffset += 106;
    
    UIButton* zero = [UIButton buttonWithImage:[UIImage imageNamed:@"DialNumber48"] backgroundImage:bg highlightedBackgroundImage:focus target:self action:@selector(keyPressAction:)];
    zero.frame = CGRectMake(xOfffset , yOffset, 106, 50);
    [self addSubview:zero];
    zero.tag = 48;
    xOfffset += 106;
    
    UIButton* message = [UIButton buttonWithImage:[UIImage imageNamed:@"DialNumber35_53"] backgroundImage:bg highlightedBackgroundImage:focus target:self action:@selector(keyPressAction:)];
    message.frame = CGRectMake(xOfffset , yOffset, 107, 50);
    [self addSubview:message];
    message.tag = 35+53;
}

-(void)keyPressAction:(UIButton*)key{
    DBG(@"press key %d",key.tag);
}

@end
