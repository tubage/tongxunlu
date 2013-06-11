//
//  IndexViewController.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-11.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "IndexViewController.h"
#import "EZNavigationController.h"
#import "SettingViewController.h"

@interface IndexViewController ()

@property(nonatomic,retain)EZTabbarController*  barController;
@property(nonatomic,retain)EZTabbarItem*        firstBarItem;
@property(nonatomic,retain)CallViewController*  callVC;
@property(nonatomic,assign)NSUInteger           preSelectTabIndex;

@end

@implementation IndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.barController = [[EZTabbarController alloc]initWithDelegate:self];
    [self.view addSubview:self.barController.view];
    self.preSelectTabIndex = -1;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark
#pragma -mark tabbar controller delegate
-(EZRootViewController *)viewControllerAtIndex:(NSUInteger)index{
    EZNavigationController* vcl = nil;
    
    switch (index) {
        case 0:{
            CallViewController* callVc = [[CallViewController alloc]initWithDefaultFrame:CGRectMake(0, 0, FULL_WIDTH, CONTENT_HEIGHT)];
            vcl = [[EZNavigationController alloc]initWithRootViewController:callVc];
            
            self.callVC = callVc;
        }
            break;
        case 1:{
            EZRootViewController*   rootVc = [[EZRootViewController alloc]initWithDefaultFrame:CGRectMake(0, 0, FULL_WIDTH, CONTENT_HEIGHT)];
            
            rootVc.showNavigationBar = YES;
            [rootVc setTitle:@"全部联系人"];
            
            vcl = [[EZNavigationController alloc]initWithRootViewController:rootVc];
        }
            break;
        case 2:{
            EZRootViewController*   rootVc = [[EZRootViewController alloc]initWithDefaultFrame:CGRectMake(0, 0, FULL_WIDTH, CONTENT_HEIGHT)];
            
            rootVc.showNavigationBar = YES;
            [rootVc setTitle:@"免费信息"];
            
            vcl = [[EZNavigationController alloc]initWithRootViewController:rootVc];
        }
            break;
        case 3:{
            SettingViewController*   rootVc = [[SettingViewController alloc]initWithDefaultFrame:CGRectMake(0, 0, FULL_WIDTH, CONTENT_HEIGHT)];
            
            vcl = [[EZNavigationController alloc]initWithRootViewController:rootVc];
        }
            break;
        default:
            break;
    }
    return vcl;

}

-(NSUInteger)numberOfTabbarItems{
    return 4;
}

-(EZTabbarItem *)tabBarController:(EZTabbarController *)tabBarCtl itemAtIndex:(NSUInteger)index{
    EZTabbarItem* item = nil;
    
    switch (index) {
        case 0:{
            item = [[EZTabbarItem alloc]initWithTitle:@"展开"
                                                  icon:[UIImage imageNamed:@"TabKeyboardDialNormal"]
                                          selectedIcon:[UIImage imageNamed:@"TabKeyboardUpSelect"]];
            
            self.firstBarItem = item;
        }
            break;
        case 1:{
            item = [[EZTabbarItem alloc]initWithTitle:@"联系人"
                                                  icon:[UIImage imageNamed:@"TabContactNormal"]
                                          selectedIcon:[UIImage imageNamed:@"TabContactSelect"]];
        }
            break;
        case 2:{
            item = [[EZTabbarItem alloc]initWithTitle:@"信息"
                                                  icon:[UIImage imageNamed:@"TabMessageNormal"]
                                          selectedIcon:[UIImage imageNamed:@"TabMessageSelect"]];
        }
            break;
        case 3:{
            item = [[EZTabbarItem alloc]initWithTitle:@"设置"
                                                  icon:[UIImage imageNamed:@"TabContactNormal"]
                                          selectedIcon:[UIImage imageNamed:@"TabCenterSelect"]];
        }
            break;
        default:
            break;
    }
    
    return item;
}


-(void)tabbar:(EZTabbar *)tabbar didSelectedAtIndex:(NSUInteger)index tabbarItem:(EZTabbarItem *)item{
    if (index == 0) {
        
        if (self.preSelectTabIndex == index) {
            if (_callVC.callViewState == CallViewShow) {
                [item setTitle:@"展开"];
                [item setSelectedIcon:[UIImage imageNamed:@"TabKeyboardUpSelect"]];
                
                [self.callVC hideKeyBoard];
            }
            else{
                [item setTitle:@"收起"];
                [item setSelectedIcon:[UIImage imageNamed:@"TabKeyboardDownSelect"]];
                
                [self.callVC showKeyBoard];
            }
        }
    }
    else{
        [_firstBarItem setTitle:@"拨号"];

    }
    
    self.preSelectTabIndex = index;
}

-(BOOL)shouldLoadTabBarAtIndex:(NSUInteger)index{
    
    self.preSelectTabIndex = index;
    
    return YES;
}

#pragma -mark
#pragma -mark call view delegate
-(void)callViewControllerWillHideKeyBoard{
    if (self.preSelectTabIndex == 0) {
        [_firstBarItem setTitle:@"展开"];
        [_firstBarItem setSelectedIcon:[UIImage imageNamed:@"TabKeyboardUpSelect"]];
    }
}

@end
