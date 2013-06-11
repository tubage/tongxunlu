//
//  User.h
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "EZRootViewController.h"

@interface User : EZRootViewController

+(id)instance;

-(BOOL)isLogin;

+(void)loginWithAction:(id)aAction selector:(SEL)aSelector;
@end
