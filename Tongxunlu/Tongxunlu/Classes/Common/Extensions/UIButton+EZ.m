//
//  UIButton+EZ.m
//  Tongxunlu
//
//  Created by kongkong on 13-6-12.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#import "UIButton+EZ.h"

@implementation UIButton (EZ)
+ (UIButton *)backButtonWithTarget:(id)target action:(SEL)action{

    return [self barButtonWithTitle:@"返回" bgImage:[[UIImage imageNamed:@"NavBackNormal"]stretchableImageWithLeftCapWidth:15 topCapHeight:14] pressImage:[[UIImage imageNamed:@"NavBackPress"]stretchableImageWithLeftCapWidth:15 topCapHeight:14] target:target action:action];
}

// 方图背景
+ (UIButton *)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    return [self barButtonWithTitle:title bgImage:[[UIImage imageNamed:@"NavItemNormal"]stretchableImageWithLeftCapWidth:6 topCapHeight:10] pressImage:[[UIImage imageNamed:@"NavItemPress"]stretchableImageWithLeftCapWidth:6 topCapHeight:10] target:target action:action];
}

+ (UIButton *)barButtonWithTitle:(NSString *)title bgImage:(UIImage*)bgImage pressImage:(UIImage*)pressImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	UIFont   *titleFont   = [UIFont boldSystemFontOfSize:14.0f];
	CGSize    titleSize   = [title sizeWithFont:titleFont];
	button.frame  = CGRectMake(0.0f, 0.0f, titleSize.width + 24, 30);
	button.titleLabel.font = titleFont;
	[button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:RGB(255.0f, 255.0f, 255.0f) forState:UIControlStateNormal];
	[button setBackgroundImage:bgImage  forState:UIControlStateNormal];
    [button setBackgroundImage:pressImage forState:UIControlStateHighlighted];
	[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
	return button;
}


//////////////////////////////////////

+ (UIButton *)leftBarButtonWithImage:(UIImage*)image highlightedImage:(UIImage*)highlightedImage target:(id)target action:(SEL)action{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.frame = CGRectMake(0.0f, 0.0f, image.size.width + 15, image.size.height + 10);
	[barButton setImage:image forState:UIControlStateNormal];
    [barButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [barButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15)];
	[barButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
	return barButton;
}

+ (UIButton *)rightBarButtonWithImage:(UIImage*)image highlightedImage:(UIImage*)highlightedImage target:(id)target action:(SEL)action{
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.frame = CGRectMake(0.0f, 0.0f, image.size.width + 15, image.size.height + 10);
	[barButton setImage:image forState:UIControlStateNormal];
    [barButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [barButton setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
	[barButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
	return barButton;
}

+ (UIButton *)buttonWithImage:(UIImage*)image backgroundImage:(UIImage*)backgroundImage highlightedBackgroundImage:(UIImage*)highlightedBackgroundImage target:(id)target action:(SEL)action{
    
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    [button setImage:image forState:UIControlStateNormal];
    
	[button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
	[button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
	return button;
}


@end
