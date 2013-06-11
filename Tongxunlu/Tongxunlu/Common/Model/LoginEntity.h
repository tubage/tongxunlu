//
//  LoginEntity.h
//  Tongxunlu
//
//  Created by kongkong on 13-6-11.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "EZEntity.h"
#import "AccountEntity.h"

@interface LoginEntity : EZEntity

@property(nonatomic,assign)NSInteger status;
@property(nonatomic,strong)AccountEntity*   account;

@end
