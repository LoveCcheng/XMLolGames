//
//  XMDataStorage.h
//  XMLolGames
//
//  Created by montnets on 2017/1/4.
//  Copyright © 2017年 montnets. All rights reserved.
/**
    保存数据到本地
 
 
 */

#import <Foundation/Foundation.h>

@interface XMDataStorage : NSObject


/** 保存信息到本地，value-值，key -键 */
+(void)saveInfo:(NSString *)value forkey:(NSString *)key;

/** 根据key从本地读取数据 */
+(NSString *)readinfoWithKey:(NSString *)key;

/** 保存用户名和密码 */
+(void)saveUserAndPass:(NSDictionary *)dict;
/** 读取用户名和密码 */
+(NSDictionary *)readUserandPass;

/** 将颜色值转换为图片 */
+(UIImage *)imageWithColor:(UIColor *)color;


@end
