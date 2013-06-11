//
//  TXLViewController.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-11.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "TXLViewController.h"
#import "LoginEntity.h"

@interface TXLViewController ()

@end

@implementation TXLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[EZRequest instance]postDataWithPath:@"/txlmain-manage/mobile/user/mobileLogin.txl" params:@{@"user.account": @"test",@"user.password":@"test"} success:^(NSDictionary *result) {

        LoginEntity* login = [[LoginEntity alloc]initWithDictionary:result isParserArray:YES];
        
        DBG(@"success %@",login);
    } failure:^(NSError *error) {
        DBG(@"@error %@",error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
