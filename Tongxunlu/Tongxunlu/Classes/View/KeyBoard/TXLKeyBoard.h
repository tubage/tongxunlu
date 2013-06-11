//
//  TXLKeyBoard.h
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXLKeyBoard : UIView{
    NSMutableArray*     _keyButtons;
}

-(id)initWithPosition:(CGPoint)position;

@end
