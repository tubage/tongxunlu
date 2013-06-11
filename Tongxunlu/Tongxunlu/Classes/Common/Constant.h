//
//  Constant.h
//  Tongxunlu
//
//  Created by kongkong on 13-6-11.
//  Copyright (c) 2013年 ELVIS zhou. All rights reserved.
//

#ifndef Tongxunlu_Constant_h
#define Tongxunlu_Constant_h

/// layout
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height
#define STATUSBAR_HEIGHT            [[UIApplication sharedApplication] statusBarFrame].size.height
#define FULL_WIDTH                  [[UIScreen mainScreen] bounds].size.width
#define FULL_HEIGHT                 SCREEN_HEIGHT - STATUSBAR_HEIGHT
#define IS_IPHONE5                  (SCREEN_HEIGHT == 568)

#define NAVBAR_HEIGHT               44.f
#define CONTENT_HEIGHT              (FULL_HEIGHT - NAVBAR_HEIGHT)
#define CONTENT_VIEW_FRAME          CGRectMake(0, NAVBAR_HEIGHT, FULL_WIDTH, CONTENT_HEIGHT)
#define FULL_VIEW_FRAME             CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)

/// constant values
#define EZ_ANIMATION_DURATION       0.4f

///view tagg
#define TAG_TITLELB     -(1<<2)

#endif
