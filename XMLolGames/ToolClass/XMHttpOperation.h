//
//  XMHttpOperation.h
//  XMLolGames
//
//  Created by montnets on 2016/12/27.
//  Copyright © 2016年 montnets. All rights reserved.
/**
    数据操作类.....
 
 
 */

#import <Foundation/Foundation.h>

@interface XMHttpOperation : NSObject

/*
 * 用户注册
 */
+(void)RegisterWithUsername:(NSString *)username Password:(NSString *)password;
/** 用户登录*/

+(void)LoginWithUsername:(NSString *)username Password:(NSString *)password;



@end
