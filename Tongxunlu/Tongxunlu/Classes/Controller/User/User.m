//
//  User.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "User.h"

@interface User (){
    BOOL    _bLogin;
}

@end

@implementation User

+(id)instance
{
    static User *_request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _request = [[User alloc] init];
    });
    
    return _request;
}

+(void)loginWithAction:(id)aAction selector:(SEL)aSelector{
    
}

@end
