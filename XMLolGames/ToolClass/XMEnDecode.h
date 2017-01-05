//
//  XMEnDecode.h
//  XMLolGames
//
//  Created by montnets on 2016/12/30.
//  Copyright © 2016年 montnets. All rights reserved.
/**
    加密和解密
 
 */

#import <Foundation/Foundation.h>



@interface XMEnDecode : NSObject

/*
 * 加密，
 *Paramtext：要加密的内容
 *key:加密对应的key
 */
+(NSString *)EncodeWithBase64:(NSString *)Paramtext andKey:(NSString *)key;

/*
 * 解密，
 *Paramtext：要解密的内容
 *key:解密对应的key
 */
+(NSString *)DecodeWithBase64:(NSString *)Paramtext andKey:(NSString *)key;


+(NSString *)encodebase64:(NSString *)param;

+(NSString *)decodebase64:(NSString *)param;


@end
