//
//  XMUserInfo.m
//  XMLolGames
//
//  Created by montnets on 2016/12/29.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMUserInfo.h"

@interface XMUserInfo ()
{
    XMUserInfo *_manager;
}

@end

@implementation XMUserInfo



+(instancetype)shareManager{
    static XMUserInfo *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =[[self alloc]init];
    });
    return manager;
}


@end
