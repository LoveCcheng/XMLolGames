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

/** 字典转换成字符串 */
+(NSString *)toJsonString:(NSDictionary *)dict;

/** 显示提示信息 */
+(void)ShowMessage:(NSString *)Message;

/** 获取数据 */
+(void)getNewsFormServce:(XMmessageType)type;


@end
